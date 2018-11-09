import UIKit
typealias completionBlock = (_ data:Data?,_ message:String?,_ error:Error?) ->Void

//Make Sure to keep the types clean. In order to do it a lot of elements will have their own struct. 


enum RemoteValue<T> {
    case unfetched
    case fetched(value: T)
}

struct FetchableValue<T> {
    let url: URL
    var value: RemoteValue<T>
    
    enum RemoteValue<T> {
        case unfetched
        case fetched(value: T)
    }
}

extension URL {
    init?(template: String) {
        let regex = "\\{.*\\}"
        let cleanedString = template.replacingOccurrences(of: regex, with: "", options: .regularExpression)
        self.init(string: cleanedString)
    }
}

extension FetchableValue: Decodable {
    init(from decoder: Decoder) throws {
        let template = try decoder.singleValueContainer().decode(String.self)
        guard let url = URL(template: template) else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: ""))
        }
        self.url = url
        value = .unfetched
    }
}




struct APIURLS{
    static let allBreeds = "https://dog.ceo/api/breeds/list/all"
    static let randomImage = "https://dog.ceo/api/breeds/image/random"
    
    static func byBreed(_ breed:String)->String{
        return "https://dog.ceo/api/breed/\(breed)/images";
    }
    
    static func bySubBreed(_ breed:String)->String{
        return "https://dog.ceo/api/breed/\(breed)/list";
    }
    
    static func randomFromBreed(_ breed:String)->String{
        return "https://dog.ceo/api/breed/\(breed)/images/random";
    }
}

typealias Breed = String
typealias SubBreed = String

struct Breeds:Decodable{
    let status:String
    var breeds: [Breed:[SubBreed]]
    let message: [String: [String]]
    
    enum Keys:String,CodingKey{
        case status
        case message
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: Keys.self)
        status = try container.decode(String.self, forKey: Breeds.Keys.status)
        breeds = try container.decode([Breed:[SubBreed]].self, forKey:Keys.message)
        message = try container.decode([String: [String]].self, forKey:Keys.message)

    }
}

//get the file
struct NetworkManager{
    func getFile(url:String, completionBlock:@escaping completionBlock){
        if let url = URL(string:url){
         let task =  URLSession.shared.dataTask(with: url) { (data, response, error) in
             //Do some processing
                completionBlock(data,response.debugDescription,error)
            }
          task.resume()
        }
    }
}

// List all breeds
//
func getJSON(){
    let manager =  NetworkManager()
    manager.getFile(url: APIURLS.allBreeds) { (data, response, error) in
        //serialize data if exists
        if let d = data {
            //deserialize it
            let decoder = JSONDecoder()
            let json = try? JSONSerialization.jsonObject(with: d, options: JSONSerialization.ReadingOptions.allowFragments)
//            print(json)
            
            if let breeds = try? decoder.decode(Breeds.self, from: d)
            {
                print(breeds.message)
            }

        }
    }
}
getJSON()






