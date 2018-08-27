//: Playground - noun: a place where people can play

import UIKit


// Are the letters unique?
// Write a function that accepts a string as its only param and returns
// true if the string has only unique letters taking letter case into account.

func isUnique(str:String)->Bool{
    var dict = [Character:Character]()
    for char in str.characters{
        if let _ = dict[char]{
            //it exists
            return false
        }
        dict[char] = char
    }
    return true
}


// Swift 4
func isUnique2(_ input: String) -> Bool {
    return Set(input).count == input.count
}


//Test Cases
isUnique(str:"Janusz")
isUnique(str:"JaAnusz")
isUnique(str:"Alibaba")

//Palindrome
func isPalindrome(_ input:String)->Bool{
    var reversed = [Character]()
    for char in input{
        reversed.insert(char, at: 0)
    }
    
    var rstring = String(reversed)
    return (rstring.lowercased() == input.lowercased())
}


isPalindrome("aba1")
isPalindrome("abab")
isPalindrome("ababa")
isPalindrome("abaCaBa")



