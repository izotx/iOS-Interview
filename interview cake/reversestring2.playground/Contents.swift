//: Playground - noun: a place where people can play

import UIKit

func mergeArrays(_ a1:[Int],_ a2:[Int]){
    var newArray = [Int]()
    //let's iterate through an array with smaller first element to see if
    //what's larger or smaller at the end copy rest
    var li = 0
    var hi = 0
    
    for i in 0..<a1.count{
        //Check if index out of bounds
//        if(a[i])
    }
    
}

let myArray = [3, 4, 6, 10, 11, 15]
let alicesArray = [1, 5, 8, 12, 14, 19]



func reverseCharacters(_ s:inout String){
    var left = s.startIndex
    var right = s.index(before: s.endIndex)
    while left < right{
        //get characters
        let leftChar = s[left]
        let rightChar = s[right]
        let leftRange = left...left
        let rightRange =  right...right
        s.replaceSubrange(leftRange, with: String(rightChar))
        s.replaceSubrange(rightRange, with: String(leftChar))
        left = s.index(after: left)
        right = s.index(before: right)
    }
}

var s1 = "12345678"
reverseCharacters(&s1)


func reverseWord( str: inout String){
    //split by word
    //"ama ve ok" => "ok ve ama"
    //var k = str.split(separator: " ")
    var low = str.startIndex
    var high = str.index(before: str.endIndex)
    var newWord = true
    while low < high {
        var lowChar = str[low]
        var highChar = str[high]
        
        if lowChar == " "{
            //beginning of new word don't move it?
        }
        else{
            low = str.index(low, offsetBy: 1)
            
        }
        
    }
    
    for char in str{
        //start of new word index
        //End of new word index
        if (char == " "){//We are the end of word
        
        }
        else{
            //Move character till the end of the message
            
        }
    }
}

//reverseWord(str: "ok ve ama")

func reverseString(str:String){
    var array = [Character]()
    for char in str{
        array.insert(char, at: 0)
    }
    print(array)
}
func re(a: inout Int ){
        a = 23
}
var k = 1
re(a: &k)

func reverse(_ str: inout String) {
    
    var leftIndex = 0
    var rightIndex = str.count - 1
    
    while leftIndex < rightIndex {
        
        // Swap characters
        let leftStrIndex = str.index(str.startIndex, offsetBy: leftIndex)
        let rightStrIndex = str.index(str.startIndex, offsetBy: rightIndex)
        
        let leftChar = str[leftStrIndex]
        let rightChar = str[rightStrIndex]
        
        let leftRange = leftStrIndex...leftStrIndex
        let rightRange = rightStrIndex...rightStrIndex
        
        str.replaceSubrange(leftRange, with: String(rightChar))
        str.replaceSubrange(rightRange, with: String(leftChar))
        
        // Move towards middle
        leftIndex += 1
        rightIndex -= 1
    }
}

func reverseString1( str :inout String){
  
    for i in 0..<str.count{
        var last = str[str.index(str.endIndex, offsetBy:-1)]
        str.insert(last, at: str.startIndex)
        str.remove(at: str.index(str.endIndex, offsetBy:-1))
        print(str)
    }
}

//var s = "1234"
//for k in s.indices{
//    print(k)
//}
//let k1 = 0...1

//reverseString1(str: &s)
//s

//reverse(&s)
