//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
var str = "Hello, playground"


let queue = OperationQueue()
let operation =  Operation()
operation.completionBlock = {print("1")}
queue.addOperation(operation)



DispatchQueue.global(qos: .background).async {
    //background code goes here
    print("b")
    DispatchQueue.main.async {
        // Update the UI
        print("aaa")
    }
}

for char in str{
//    print(char)
}

let s1 = [1,2,4]
let s2 = ["a","b","c"]
let s3 = zip(s1,s2)
//s3
//print(s3)


let nearestStarNames = ["Proxima Centauri", "Alpha Centauri A", "Alpha Centauri B", "Barnard's Star", "Wolf 359"]
let nearestStarDistances = [4.24, 4.37, 4.37, 5.96, 7.78]

// Dictionary from sequence of keys-values
let starDistanceDict = Dictionary(uniqueKeysWithValues: zip(nearestStarNames, nearestStarDistances))
// ["Wolf 359": 7.78, "Alpha Centauri B": 4.37, "Proxima Centauri": 4.24, "Alpha Centauri A": 4.37, "Barnard's Star": 5.96]


let closeStars = starDistanceDict.filter { $0.value < 5.0 }
closeStars
let mappedCloseStars = closeStars.mapValues { "\($0)" }
mappedCloseStars

let k = ["a":1, "b":2]
let b = k.mapValues{"\($0)"}
b

PlaygroundPage.current.needsIndefiniteExecution = true

