//: Playground - noun: a place where people can play

import UIKit

func canTwoMovies(in movieLengths: [Int], fillFlight flightLength: Int) -> Bool {
    
    // movie lengths we've seen so far
    var movieLengthsSeen = Set<Int>()
    
    for firstMovieLength in movieLengths {
        let matchingSecondMovieLength = flightLength - firstMovieLength
        if movieLengthsSeen.contains(matchingSecondMovieLength) {
            return true
        }
        
        movieLengthsSeen.insert(firstMovieLength)
    }
    
    // we never found a match, so return false
    return false
}


func checkTimes(_ times:[Int], time:Int)->Bool{
    // [0,2,5,3] 00 02 05 03 20 22 25 23
    // [0,2,5,3]
    for i in 0..<times.count-1{
        for j in i+1..<times.count{
            if times[i] + times[j]  < time{
                return true
            }
        }
    }
    
    return false
}

checkTimes([0,2,5,3], time: 4)
