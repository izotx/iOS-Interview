import UIKit

class Meeting: CustomStringConvertible {
    
    var startTime: Int
    var endTime: Int
    
    init(startTime: Int, endTime: Int) {
        
        // number of 30 min blocks past 9:00 am
        self.startTime = startTime
        self.endTime = endTime
    }
    
    var description: String {
        return "(\(startTime), \(endTime))"
    }
    
    /** Write a function mergeRanges() that takes an array of multiple meeting time ranges and returns an array of condensed ranges. */
   
    
}
func mergeRanges(_ meetings: [Meeting])->[Meeting]{
    
    //Do I have to sort it?
    //we can loop through list of meetings
    // check if start time is equal or in between the start and end time, if so merge. If not return just
    var newMeetings = [Meeting]()
    for m1 in meetings{
        var start = m1.startTime
        var end = m1.endTime
        for m2 in meetings{
            
            //m2 started before but ended inside or after
            if m2.endTime >= start && m2.startTime <= start{
                start = m2.startTime
                end = m2.endTime > end ? m2.endTime : end
            }
            //m2 inside m1 or after
            if m2.startTime >= start && m2.startTime <= end{
                start = m2.startTime > start ? start : m2.startTime
                end = m2.endTime > end ? m2.endTime : end
            }
        }
        if  (newMeetings.filter{ $0.startTime == start && $0.endTime == end}).count == 0{
            newMeetings.append(Meeting(startTime: start, endTime: end))
        }
    }
    
    return newMeetings
}

let m = [
    Meeting(startTime: 0,  endTime: 1),
    Meeting(startTime: 3,  endTime: 5),
    Meeting(startTime: 4,  endTime: 8),
    Meeting(startTime: 10, endTime: 12),
    Meeting(startTime: 9,  endTime: 10)
]

//var mee = Meeting()

let r1 = mergeRanges(m)
print(r1)

let m1 =   [
    Meeting(startTime: 1, endTime: 10),
    Meeting(startTime: 2, endTime: 6),
    Meeting(startTime: 3, endTime: 5),
    Meeting(startTime: 7, endTime: 9)
]

let r2 = mergeRanges(m1)
print(r2)
