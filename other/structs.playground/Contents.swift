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

let v = UserView(startTime: 0, endTime: 10)
let v1 = UserView(startTime: 20, endTime: 30)
let v2 = UserView(startTime: 30, endTime: 60)
let views =  [v,v1,v2]

var vv = views[0]
vv.endTime = 100
print(vv.endTime)

var vvv = views[0]
print(vvv.endTime)

