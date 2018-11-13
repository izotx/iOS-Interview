import UIKit

struct Video{
    var duration:Int
}
class UserView{
    var startTime:Int
    var endTime:Int
    
    init(startTime:Int, endTime:Int) {
        self.startTime = startTime
        self.endTime = endTime
    }
}

enum VideoError:Error, CustomStringConvertible{
     case VideoDurationError
    var description: String{
        return "Video Error"
    }
}


func percentage(video:Video, views:[UserView])throws ->Double{
    guard video.duration > 0 else{
        throw VideoError.VideoDurationError
    }
    
    //If there are no views we are returning zero
    guard views.count > 0 else{
        return 0
    }
    
    var mergedViews = [views[0]]
    for view in views{
        //get last view from merged views
        let last = mergedViews.last!
        //Collapse the elements
        if last.endTime >= view.startTime{
            last.endTime = view.endTime
        }//Element separated from the last one
        else{
            mergedViews.append(view)
        }
    }
    //Total Duration in Seconds
    let duration =  mergedViews.reduce(0) { (result, view) -> Int in
        return result + (view.endTime - view.startTime)
    }
    
    return Double(duration)/Double(video.duration) * 100
}

//test
let v = UserView(startTime: 0, endTime: 10)
let v1 = UserView(startTime: 20, endTime: 40)
let v2 = UserView(startTime: 40, endTime: 60)

let video = Video(duration: 60)

let videoPercentage = try percentage(video: video, views: [v,v1,v2])
videoPercentage ==  Double(50)/Double(60) * 100

