import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

enum CustomError:Error,CustomStringConvertible{
    case wrongURL(String)
    
    var description: String{
        return "Wrong url"
    }
}



func download() throws {
//    let urlstring = "https://dog.ceo/api/breeds/list/all"
    let urlstring = "all"
    guard let url = URL(string:urlstring) else{
        print("assaas")
        throw CustomError.wrongURL(urlstring)
    }
    print(url)
    let session = URLSession.shared
    
    //Asynchronus operation
    let task = session.dataTask(with: url) { (data, response, error) in
        if(error != nil){
            print("error")
        }
        
        if let data = data{
            //Should we parse it here ? Or not
        
            
        }
        
        //check for error
        //check for data
        //check or response
        
    }
    task.resume()
}

do{
    try download()
}
catch{
    print("\(error)")
}




