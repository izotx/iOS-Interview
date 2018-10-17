//: Playground - noun: a place where people can play

import UIKit

extension Character {
    static func isLetter(_ character: Character) -> Bool {
        return "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".characters.contains(character)
    }
}

func wordCloud(_ s:String)->[String:Int] {
    var dictionary = [String:Int]()
    var words = s.split(separator: " ")
    for word in words{
        let w = word.lowercased()
        if let k = dictionary[w] {
            dictionary[w] = k + 1
        }
        else{
            dictionary[w] = 1
        }
    }
    return dictionary
}



var str = "Hello, playground, hello, hallo"
wordCloud(str)
