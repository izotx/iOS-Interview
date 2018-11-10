import UIKit

func mergeArrays(_ a1:[Int], _ a2:[Int])->[Int]{
    var i = 0;
    var j = 0;

    var sorted = [Int]()
    while i < a1.count && j < a2.count{
        let el1 = a1[i]
        let el2 = a2[j]
        if (el1 <= el2){
            sorted.append(el1)
            i += 1
        }else{
            sorted.append(el2)
            j += 1
        }
    }

    for index in i..<a1.count{
        sorted.append(a1[index])
    }

    for index in j..<a2.count{
        sorted.append(a1[index])
    }
    
    return sorted;
}

let myArray = [3, 4, 6, 10, 11, 15]
let alicesArray = [1, 5, 8, 12, 14, 19]

print(mergeArrays(myArray, alicesArray))

