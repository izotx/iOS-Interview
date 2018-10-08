//: Playground - noun: a place where people can play
//https://www.raywenderlich.com/567-urlsession-tutorial-getting-started
//https://developers.eos.io/eosio-nodeos/reference#get_info
//https://medium.com/flawless-app-stories/the-complete-guide-to-network-unit-testing-in-swift-db8b3ee2c327
//https://roadfiresoftware.com/2018/02/how-to-parse-json-with-swift-4/
//https://medium.com/@jhoomuck/composing-asynchronous-functions-in-swift-acd24cf5b94a
//https://medium.com/flawless-app-stories/parallel-programming-with-swift-promises-740be1a260ed
//https://ioscoachfrank.com/2017/03/18/chaining-nsoperations.html

//https://marcosantadev.com/4-ways-pass-data-operations-swift/

/**
 App has a button which when clicked will display a list of the 20 most recent blocks
 When user clicks on a block they should be taken to a Block Details Screen.
 The Details screen should show a summary view with of the block which contains the producer, count of transactions and the producer signature.
 The Details screen should have a toggle to show and hide the raw contents of the transaction.
 Application Code viewable Publicly on Github
 Screenshots of working application should be in the github Readme
 Application should be written in Swift4
 Application should have unit tests
  */



import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

protocol Producer{
    var PRODUCER_URL:String {get}
    var INFO_ENDPOINT:String {get}
    var GET_BLOCK_ENDPOINT:String {get}
}

class NewYorkProducer:Producer{
    var PRODUCER_URL = "https://api.eosnewyork.io"
    var INFO_ENDPOINT = "https://api.eosnewyork.io/v1/chain/get_info"
    var GET_BLOCK_ENDPOINT = "https://api.eosnewyork.io/v1/chain/get_block"
}



enum EOSError: Error {
    case unknownError
    case connectionError
    case invalidCredentials
    case invalidRequest
    case notFound
    case invalidResponse
    case serverError
    case serverUnavailable
    case timeOut
    case parsingJSON
    case currentlyDownloading
}



struct ChainInfo:Decodable{
    let lastBlock:Int
    enum CodingKeys : String, CodingKey {
         case lastBlock = "last_irreversible_block_num"
    }
}

struct Block:Decodable{
    let block_num:Int
    let previous:String
    let producer:String
    let producer_signature:String
    let transactions:[Transaction]
}

struct Transaction:Decodable{
    let status:String
}

enum BlockState {
    case new, parsed, failed
}


/**Based on Network Unit Testing in Swift*/
class HttpClient {
    typealias completeClosure = ( _ data: Data?, _ error: Error?)->Void
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func post( url: URL, body:Data?, callback: @escaping completeClosure ) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        let task = session.dataTask(with: request) { (data, response, error) in
            callback(data, error)
        }
        task.resume()
    }
}


/**Responsible for blockchain operations */
class BlockchainOperations{
    private let client:HttpClient
    private var max:Int!
    private var blocks = [Block]()
    private var isRunning:Bool = false
    private var producer:Producer!
    
    //Completion blocks
    typealias blocksCompleteClosure = ( _ blocks: [Block], _ error: Error?)->Void
    typealias blockCompleteClosure = ( _ blocks: Block?, _ error: Error?)->Void
    typealias chainCompleteClosure = ( _ chain: ChainInfo?, _ error: Error?)->Void
    
    
    init(session:URLSession,producer:Producer) {
        self.client = HttpClient(session: session)
        self.producer = producer
    }
    
    
    
    func downloadBlocks(_ blocks_num:Int, completion: @escaping blocksCompleteClosure ){
        if isRunning{
            return
        }
        
        //Getting n blocks
        max = blocks_num
        isRunning = true
        
        getGeneralInfo { (info,error) in
            
            if let error = error
            {
                print(error)
                self.isRunning = false
                completion(self.blocks,error)
                return
            }
            if let info = info {
                let head_id = String(info.lastBlock)
                //Finally start downloading
                
                self.download(blockid: head_id, { (_blocks, _error) in
                    self.isRunning = false
                    completion(_blocks,_error)

                })
            }else{
                self.isRunning = false
                completion(self.blocks, EOSError.unknownError)
            }
        }
    }

    /**Responsible for downloading block with given block id*/
    func download(blockid:String, _ completion:@escaping blocksCompleteClosure){
        if blocks.count == max{
            completion(self.blocks,nil)
            return
        }

        getBlockContents(block:blockid) { (info,error) in
            if let info = info{
                self.blocks.append(info)
                self.download(blockid: info.previous, completion)
           }else{
                completion(self.blocks,error)
            }
        }
    }

    
    /**Responsible for downloading information about latest information about chain/ block*/
    func getGeneralInfo(completion:@escaping chainCompleteClosure){
        let urlString = self.producer.INFO_ENDPOINT
        
        guard let url = URL(string:urlString ) else{
            print("error \(urlString)")
            
            return
        }
        client.post(url: url, body: nil) { (data, error) in
            
            guard let data = data, error == nil else {
                print("error=\(error.debugDescription)")
                completion(nil, EOSError.invalidResponse)
                return
            }
            
            guard let info = try? JSONDecoder().decode(ChainInfo.self, from: data) else{
                completion(nil, EOSError.parsingJSON)
                return
            }
            
            completion(info,nil)
        }
    }
    
    func getBlockContents(block:String,  completion: @escaping blockCompleteClosure){
        let urlString = self.producer.GET_BLOCK_ENDPOINT
        
        guard let url = URL(string:urlString ) else{
            print("error \(urlString)")
            completion(nil,EOSError.invalidRequest)
            return
        }
        
        //Pass Block Number/id in JSON
        let json: [String: Any] = ["block_num_or_id":block]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        client.post(url: url, body: jsonData) { (data, error) in
            guard let data = data, error == nil else {
                print("error=\(error.debugDescription)")
                completion(nil,error)
                return
            }
            
            guard  let info = try? JSONDecoder().decode(Block.self, from: data) else{
                completion(nil,EOSError.parsingJSON)
                return
            }

            completion(info,nil)
        }
    }
}

let session = URLSession.shared
let producer = NewYorkProducer()
let operations = BlockchainOperations(session: session,producer:producer)

operations.downloadBlocks(2){(blocks,error) in
    //if let error do something
    print(blocks.count)
    //if not display
}

