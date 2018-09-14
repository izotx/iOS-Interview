//: Playground - noun: a place where people can play

import UIKit

func quicksort(_ a: inout [Int] ,left:Int, right:Int) -> [Int]{
    guard left < right else{
        return a
    }
    //partition array
    let pivot = partition(&a, left: left, right: right)
    
    quicksort(&a, left: left, right: pivot - 1)
    quicksort(&a, left: pivot, right: right)
    
    return a
}


// Keeping track of subarrays a low ... i < pivot
/*
    a[low...i] contains all values <= pivot moving everything less than pivot before i
    a[i+1...j-1] contains all values > pivot
    a[j...high-1] are values we haven't looked at yet
    a[high] is the pivot value
    first iteration:
    l = 0
    j = 0
    right = 5
*/

func partition(_ a:inout[Int], left:Int, right:Int)->Int{
    let pivot = a[right]
    var l = left
    let h = right
    for j in left ..< right{
        if(a[j]) <= pivot{
            //Putting All Values less than pivot in first part of the array before i
            (a[l],a[j]) = (a[j],a[l])
            l += 1
        }
    }
         // put pivot in its right place
        (a[l],a[right]) = (a[right],a[l])
    return l
}


var k1 = [12,2,5,7,15]

quicksort(&k1, left: 0, right: k1.count - 1)
k1



func quicksort1( _ array: inout  [Int])->[Int]{
    
    guard array.count > 1 else{ return array}
    
    //pick pivot
    let pivot = array[array.count / 2]

    //less than pivot
    var l = array.filter{$0 < pivot}
    var eq = array.filter{$0 == pivot}
    var m = array.filter{$0 > pivot}

    //let a = l + eq + m
   return quicksort1(&l) + eq + quicksort1(&m)
}

var k = [12,2,5,7,1]
quicksort1(&k)

//
//func quicksort1(_ array:[Int] ,left:Int, right:Int) -> [Int]{
//    var result = array
//    //Base Condition
//    if(left >= right){
//        return result
//    }
//
//    let pivot = array[(left + right) / 2]
//    let r = partition(result, left: left, right: right, pivot: pivot)
//    let index = r.0
//    let a = r.1
//
//    result = a
//    result = quicksort(&result, left: left, right: index - 1)
//    result = quicksort(&result, left: index + 1, right:right)
//
//    return result
//}

//
//func partition(_ array:[Int] ,left _left:Int, right _right:Int,pivot:Int) -> (Int, [Int]){
//    var result = array
//    var left = _left
//    var right = _right
//
//    while left <= right {
//        while(array[left] < pivot){
//            left += 1
//        }
//
//        while(array[right] > pivot){
//            right -= 1
//        }
//
//        if(left <= right){
//            //swap
//            left += 1
//            right += 1
//            result = swap(array,left,right)
//        }
//    }
//    return (left, result)
//}

func swap(_ _array:[Int], _ left:Int, _ right: Int)->[Int]{
    var array = _array
    let temp = array[right]
    array[right] = array[left]
    array[left] = temp
    return array
}


var array = [9,3,5,1,7,1]
//mergesort(array)

//quicksort(array, left: 0, right: array.count - 1)


//(array[0],array[1]) = (array[1],array[0])
//array






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
