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

struct API{
    static let PRODUCER_URL = "https://api.eosnewyork.io"
    static let INFO_ENDPOINT = "v1/chain/get_info"
    static let GET_BLOCK_ENDPOINT = "v1/chain/get_block"
}


struct ChainInfo:Decodable{
    let lastBlock:Int
    enum CodingKeys : String, CodingKey {
         case lastBlock = "last_irreversible_block_num"
    }
}

struct BlockInfo:Decodable{
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


class PendingOperations {
      lazy var downloadsInProgress: [IndexPath: Operation] = [:]
      lazy var downloadQueue: OperationQueue = {
        var queue = OperationQueue()
        queue.name = "Download queue"
        queue.maxConcurrentOperationCount = 1
        return queue
    }()

}




//Sample Response
//


//Fetch Block


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
            
            if let data = data, let body_response = String(data: data, encoding: String.Encoding.utf8) {
                print(body_response)
            }
            
            callback(data, error)
        }
        task.resume()
    }
}


let session = URLSession.shared
let client = HttpClient(session: session)

// Add Error Codes
// Networking Error
// Data Integrity

///13362625
func getGeneralInfo(completion:@escaping (ChainInfo?)->Void){
    let urlString = "\(API.PRODUCER_URL)/\(API.INFO_ENDPOINT)"
    
    guard let url = URL(string:urlString ) else{
        print("error \(urlString)")
        
        return
    }
    client.post(url: url, body: nil) { (data, error) in
        
        guard let data = data, error == nil else {
            print("error=\(error.debugDescription)")
            return
        }

        guard let info = try? JSONDecoder().decode(ChainInfo.self, from: data) else{
            print("debug description")
            return
        }
        //        print(info)
        completion(info)
    }
}

func getBlockContents(block:String,info:(BlockInfo?)->Void){
    let urlString = "\(API.PRODUCER_URL)/\(API.GET_BLOCK_ENDPOINT)"
    
    guard let url = URL(string:urlString ) else{
        print("error \(urlString)")
        
        return
    }
    
    let json: [String: Any] = ["block_num_or_id":block]
    let jsonData = try? JSONSerialization.data(withJSONObject: json)

    client.post(url: url, body: jsonData) { (data, error) in
        guard let data = data, error == nil else {
            print("error=\(error.debugDescription)")
            return
        }
        
        let info = try! JSONDecoder().decode(BlockInfo.self, from: data)
        print("Block")
        print(info.block_num)
//        getBlockContents(block: info.previous)
        
    }
    
}


func getContents(block:Int){
    
    // 2
    var dataTask: URLSessionDataTask?
    let json: [String: Any] = ["block_num_or_id":block]
    let jsonData = try? JSONSerialization.data(withJSONObject: json)

    let urlString = "https://api.eosnewyork.io/v1/chain/get_block"
    guard let url = URL(string: urlString) else { return }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.httpBody = jsonData
    
   let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard let data = data, error == nil else {
            print("error=\(error.debugDescription)")
            return
        }
        
        if let body_response = String(data: data, encoding: String.Encoding.utf8) {
//            print(body_response)
        }
    }

    print("Aaa")
    task.resume()
}

//getBlockContents(block:"13363637")
//getGeneralInfo()

func operations(){
    var pendingOperations = PendingOperations()
    //get main
    getGeneralInfo { (info) in
//        print(info)
        if let i = info{
            let block = i.lastBlock
            print(block)
            let op = Operation()
            op.completionBlock
        }
    
    
    }
}


class BlockOperation:Operation{
    var blockInfo:BlockInfo?
    private let block_id:String
    
    init(block_id:String) {
        self.block_id = block_id
    }
    
    override func main(){
        getBlockContents(block: self.block_id) { (info) in
            print("Executed")
            if let info = info{
                
            }else{
                
            }
            
            print(info)
        }
    }
}



//operations()
