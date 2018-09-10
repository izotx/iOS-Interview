//: Playground - noun: a place where people can play

import UIKit

func bubbleSort(_ _array:[Int])->[Int]{
    var array = _array
   
    for _ in 0..<array.count{
        for j in 0..<array.count-1{
            if array[j] > array[j + 1] {
                let swap = array[j+1]
                array[j + 1] = array[j]
                array[j] = swap
            }
        }
    }
    return array
}

let array = [0,3,5,1,2]
let k = bubbleSort(array)
