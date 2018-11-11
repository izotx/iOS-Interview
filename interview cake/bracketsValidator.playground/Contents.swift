//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
 You're working with an intern that keeps coming to you with JavaScript code that won't run because the braces, brackets, and parentheses are off. To save you both some time, you decide to write a braces/brackets/parentheses validator.
 
 Let's say:
 
 '(', '{', '[' are called "openers."
 ')', '}', ']' are called "closers."
 Write an efficient function that tells us whether or not an input string's openers and closers are properly nested.
 
 Examples:
 
 "{ [ ] ( ) }" should return true
 "{ [ ( ] ) }" should return false
 "{ [ }" should return false
 */


func validator(_ input:String)->Bool{
    var lastOpener:String? = nil
    var stack=[String]()
    for char in input{
        if String(char) == "(" || String(char) == "{" || String(char) == "["
        {
              stack.append(char)
        }
        if String(char) == ")"
        {
            guard stack.count > 0 else{
                return false
            }
            let last = stack.removeLast()
            
        }
    }
    return false
}
