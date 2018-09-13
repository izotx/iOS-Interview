//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"

// pick pivot
// check if first element  is smaller or bigger
// [2,4,3,8,1]
// if  array[index] > array[pivot]
// var temp = array[pivot - 1]
// array[pivot-1] = array[pivot]
// array[pivot] =
// array[index] = temp
//while(index < pivot
//


// return the contents of the input array sorted least to greatest
// create any helper functions you need :)
// want to get fancy? try making input an "inout" parameter, rather than copying it to "result"
// more information here: https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Functions.html#//apple_ref/doc/uid/TP40014097-CH10-ID166
func quicksort1(_ input: [Int], low: Int, high: Int) -> [Int] {
    // this is a copy of the input so its contents can be modified
    var result = input
    
    // check the base case: low is less than high
    guard low < high else{
        return result
    }
    // select the pivot
    var  pivot = high
    // perform the partitioning step
    var index = low
    
    while(index < pivot){
        if result[index] > result[pivot]{
            let temp = result[pivot - 1]
            result[pivot-1] = result[pivot]
            result[pivot] = result[index]
            result[index] = temp
            pivot -= 1
        }else{
            index += 1
        }
    }
    // make the recursive call with the new high and low values

    
    return quicksort(result, low: index, high: pivot)
}

func quicksort(_ input: [Int], low: Int, high: Int) -> [Int] {
    var result = input
    
    if low < high {
        let pivot = result[high]
        var i = low
        
        for j in low..<high {
            if result[j] <= pivot {
                (result[i], result[j]) = (result[j], result[i])
                i += 1
            }
        }
        (result[i], result[high]) = (result[high], result[i])
        result = quicksort(result, low: low, high: i - 1)
        result = quicksort(result, low: i + 1, high: high)
    }
    
    return result
}

// Test case
var testArray = [21, 4, 1, 3, 9, 20, 25, 6, 21, 14]
///print(quicksort(testArray, low: 0, high: testArray.count - 1))
quicksort(testArray, low: 0, high: testArray.count - 1)

