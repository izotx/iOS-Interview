//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


func mergesort(_ array:[Int])->[Int]{
    //Recursive Base Condition
    guard array.count > 1 else{
        return array
    }
    
    //Divide array into small chanks
    let middle = array.count / 2
    let left = mergesort( Array(array[0..<middle]))
    let right = mergesort(Array(array[middle..<array.count]))
    
    return merge(left:left, right:right)
}

func merge(left:[Int],right:[Int])->[Int]{
    
    var leftIndex = 0
    var rightIndex = 0
    var array = [Int]()
    while(leftIndex < left.count && rightIndex < right.count){
        ///Three Cases
        if(left[leftIndex] < right[rightIndex]){
            array.append(left[leftIndex] )
            leftIndex += 1
        }
        else if(left[leftIndex] > right[rightIndex]){
            array.append(right[rightIndex] )
            rightIndex += 1
        }
        else{
            array.append(right[leftIndex] )
            array.append(left[leftIndex] )

            rightIndex += 1
            leftIndex += 1
            
        }
    }
    
    while leftIndex < left.count{
        array.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count{
        array.append(right[rightIndex])
        rightIndex += 1
    }
    
    return array
}

let array = [9,3,5,1,7,1]
mergesort(array)

