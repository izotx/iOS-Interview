import UIKit

var str = "Hello, playground"

enum DownloadError:Error{
    case WrongURL
}



//Networking
func downloadSomething(urlString:String, completionHandler:@escaping (Data?,Error?)->Void){
   let config =  URLSessionConfiguration.default
   let session = URLSession(configuration: config)
    // Or URLSession.shared
    guard let url = URL(string:urlString)else{
        completionHandler(nil, DownloadError.WrongURL)
        return
    }
    
    let task = session.dataTask(with: url) { (data, response, error) in
        completionHandler(data,error)
    }
    task.resume()
}



//Threading
//1 GCD
//Specify which queue: (global, main,custom), with wich quality qos: User-Interactive, user initiated, utility, background, and then async or sync execution
/*
 @escaping closures:
 When passing a closure as the function argument, the closure is being preserve to be execute later and function’s body gets executed,
 
 */
DispatchQueue.global(qos: .userInitiated).async {
        //background tasks
        //calculate PI
    DispatchQueue.main.async {
        //run on a main thread
        //remember about weak reference
    }
}

//NSOperation
/*
 Operation is an abstract class, designed for subclassing. Each subclass represents a specific task
 */
let queue = OperationQueue.main

enum PhotoRecordState {
    case new, downloaded, filtered, failed
}

struct PhotoRecord {
    let name: String
    let url: URL
    var state = PhotoRecordState.new
    var image = UIImage(named: "Placeholder")
    
    init(name:String, url:URL) {
        self.name = name
        self.url = url
    }
}

class ImageDownloader: Operation {
    //1
    var photoRecord: PhotoRecord
    
    //2
    init(_ photoRecord: PhotoRecord) {
        self.photoRecord = photoRecord
    }
    
    //3
    override func main() {
        //4
        if isCancelled {
            return
        }
        
        //5
        guard let imageData = try? Data(contentsOf: photoRecord.url) else { return }
        
        //6
        if isCancelled {
            return
        }
        
        //7
        if !imageData.isEmpty {
            photoRecord.image = UIImage(data:imageData)
            photoRecord.state = .downloaded
        } else {
            photoRecord.state = .failed
            photoRecord.image = UIImage(named: "Failed")
        }
    }
}

let op = ImageDownloader(PhotoRecord(name: "photo", url: URL(string:"https://www.futurity.org/wp/wp-content/uploads/2018/04/pink-flowers-against-green_1600.jpg")!))
queue.addOperation(op)

