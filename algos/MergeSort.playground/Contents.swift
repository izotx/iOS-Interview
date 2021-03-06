//: Playground - noun: a place where people can play

import UIKit

let array = [7, 2, 6, 3, 9]

func mergeSort(_ array: [Int]) -> [Int] {
    
    guard array.count > 1 else { return array }
    
    // 1
    let middleIndex = array.count / 2
    // 2 Dividing the array
    let leftArray =  mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return merge(leftArray, rightArray)
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray: [Int] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        // challenge!
        if(left[leftIndex]<right[rightIndex]){
            orderedArray.append(left[leftIndex])
            leftIndex += 1
        }else if(left[leftIndex] > right[rightIndex]) {
            orderedArray.append(right[rightIndex])
            rightIndex += 1
        }else{
            orderedArray.append(left[leftIndex])
            leftIndex += 1
            orderedArray.append(right[rightIndex])
            rightIndex += 1
        }
    }
    // 2
    while leftIndex < left.count {
        orderedArray.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count {
        orderedArray.append(right[rightIndex])
        rightIndex += 1
    }
    
    return orderedArray
}

mergeSort(array)

