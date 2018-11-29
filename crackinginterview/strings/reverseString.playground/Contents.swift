//: Playground - noun: a place where people can play

import UIKit

func reverseWords(_ string:inout String){
    guard string.count > 0 else{
        return
    }
    var words = [String]()
    var beginningOfNewWord:Int = 0
    for (index,char) in string.enumerated(){
        
        if String(char) == " "{
            //found space
            //index > beginning add a new word
            //else 
        }
    }
    
}

var str = "Hello, playground"
var message = "cake pound steal"

reverseWords(&message)

print(message)
// prints: "steal pound cake"
