//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func mergeArray(_ a1: [Int], _ a2: [Int])->[Int]{
    
    var indexA = 0
    var indexB = 0
    
    var result = [Int]()
    //pick one element from array compare it to other array append lower number, at the end add the reemaining
    while indexA < a1.count && indexB < a2.count{
         print(indexB)
         print(indexA)
        
        let el1 = a1[indexA]
        let el2 = a2[indexB]
        if el1 > el2{
            result.append(el2)
            indexB += 1
        }
       else if el1 < el2 {
            result.append(el1)
            indexA += 1
        }
        else {
            result.append(el1)
            result.append(el2)
            indexA += 1
            indexB += 1
        }
    }

    
    if indexA < a1.count{
        for i in indexA..<a1.count{
            result.append(a1[i])
        }
    }

    if indexB < a2.count{
        for i in indexB..<a2.count{
            result.append(a2[i])
        }
    }
    
    
    return result
}

let a1 = [1, 5, 8]
let a2 =  [2, 4, 10]
mergeArray(a1, a2)

