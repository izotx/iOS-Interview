//: Playground - noun: a place where people can play

import UIKit

func checkTime(_ times:[Int],_ flightTime:Int  )->Bool{
    var  movies = Set<Int>()
    for time in times{
        //basically we need to check if there is a movie that will take flightTime - time
        let remaining = flightTime - time
        if movies.contains(remaining){
            return true
        }
        movies.insert(remaining)
    }
    
    
    return false
}
