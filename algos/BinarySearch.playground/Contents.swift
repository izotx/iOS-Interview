//: Playground - noun: a place where people can play

import UIKit
//O(n) log(n)

func binarySearch(searchingFor el:Int,array:[Int] )->Bool{
    var start = 0
    var end = array.count
    var middle:Int =  (start + end )/2
  
    while (start < end ){
      
        if (array[middle] == el){
            return true
        }
        if(array[middle] > el){
            end = middle - 1
        }
        else{
            start = middle + 1
        }
        middle = (start + end )/2
    }
    
    return array[middle] == el

}
func binarySearchSimple(searchingFor el:Int,array:[Int] )->Bool{
    var start = 0
    var end = array.count
    var middle:Int =  (start + end )/2
    
    while (start <= end ){
        middle = (start + end )/2
        if(array[middle] > el){
            end = middle - 1
        }
        else if (array[middle] < el) {
            start = middle + 1
        }
        else{
            return true
        }
    }
    return false
}

func recursiveBinary(array:[Int], start:  Int, middle:  Int, end: Int, el:Int)->Bool{
    var nm = middle
    var ns = start
    var ne = end
    if array[middle] == el{
        return true
    }
    //another pre condition
    if(start == end){
        return false
    }
    
    if el < array[middle]{
        ne = nm - 1
    }else{
        ns = nm + 1
    }
    nm = (ns + ne) / 2
    
    return recursiveBinary(array: array, start: ns, middle: nm, end: ne, el: el)
}


func testLinearVersion(array:[Int]){
    binarySearch(searchingFor: 4, array: array)
    binarySearch(searchingFor: 5, array: array)
    binarySearchSimple(searchingFor: 14, array: array)
    binarySearchSimple(searchingFor: 15, array: array)

}
func testRecursiveBinary(array:[Int]){
    let start = 0
    let end = array.count - 1
    let middle = (start + end ) / 2
    recursiveBinary(array: array, start: start, middle: middle, end: end, el: 9)
    recursiveBinary(array: array, start: start, middle: middle, end: end, el: 3)
    recursiveBinary(array: array, start: start, middle: middle, end: end, el: 6)

}
let array = [1,5,9,14,19]

testLinearVersion(array: array)

