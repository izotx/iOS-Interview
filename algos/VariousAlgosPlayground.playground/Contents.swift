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


func quicksort(array:[Int]){
    
}

func quicksort(_ array:[Int] ,left:Int, right:Int) -> [Int]{
    var result = array
    //Base Condition
    if(left >= right){
        return result
    }
    
    let pivot = array[(left + right) / 2]
    let r = partition(result, left: left, right: right, pivot: pivot)
    let index = r.0
    let a = r.1
    
    result = a
    result = quicksort(result, left: left, right: index - 1)
    result = quicksort(result, left: index + 1, right:right)

    return result
}


func partition(_ array:[Int] ,left _left:Int, right _right:Int,pivot:Int) -> (Int, [Int]){
    var result = array
    var left = _left
    var right = _right

    while left <= right {
        while(array[left] < pivot){
            left += 1
        }
        
        while(array[right] > pivot){
            right -= 1
        }
        
        if(left <= right){
            //swap
            left += 1
            right += 1
            result = swap(array,left,right)
        }
    }
    return (left, result)
}

func swap(_ _array:[Int], _ left:Int, _ right: Int)->[Int]{
    var array = _array
    let temp = array[right]
    array[right] = array[left]
    array[left] = temp
    return array
}


var array = [9,3,5,1,7,1]
//mergesort(array)

quicksort(array, left: 0, right: array.count - 1)


(array[0],array[1]) = (array[1],array[0])
array


