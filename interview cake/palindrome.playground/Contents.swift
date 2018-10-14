//: Playground - noun: a place where people can play

import UIKit
/**
 Write an efficient function that checks whether any permutation ↴ of an input string is a palindrome. ↴
 
 You can assume the input string only contains lowercase letters.
 
 Examples:
 
 "civic" should return true
 "ivicc" should return true
 "civil" should return false
 "livci" should return false
 */

func hasPalindromePermutation(in theString: String) -> Bool {
    
    // track characters we've seen an odd number of times
    var unpairedCharacters: Set<Character> = []
    
    for character in theString {
        if unpairedCharacters.contains(character) {
            unpairedCharacters.remove(character)
        } else {
            unpairedCharacters.insert(character)
        }
    }
    
    // the string has a palindrome permutation if it
    // has one or zero characters without a pair
    return unpairedCharacters.count <= 1
}


func amIPalindrome2(_ s:String)->Bool{
    //Palindrome is a word that is spelled the same way backwards
    //so what are rules behind it? Basically the string should not have more than one uneven numbers of characters
    
    var dictionary = [Character:Int]()
    for char in s{
        if let k = dictionary[char]{
           dictionary[char] = k + 1
        }else{
            dictionary[char] = 1
        }
    }
    var c = 0
    for k in dictionary{
        if k.value == 1{
            c += 1
        }
    }
    
    return c <= 1
}




var str = "Hello, playground"
amIPalindrome2(str)
amIPalindrome2("alila")



