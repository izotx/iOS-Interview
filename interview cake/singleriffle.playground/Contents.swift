//: Playground - noun: a place where people can play

import UIKit
/**
 cut the deck into halves half1 and half2
 grab a random number of cards from the top of half1 (could be 0, must be less than or equal to the number of cards left in half1) and throw them into the shuffledDeck
 grab a random number of cards from the top of half2 (could be 0, must be less than or equal to the number of cards left in half2) and throw them into the shuffledDeck
 repeat steps 2-3 until half1 and half2 are empty.
 */

func popOne(_ array:[Int])->[Int]{
    if array.count <= 1{
        return []
    }
    
    return Array(array[1..<array.count])
}

func singleRifle(half1:[Int], half2:[Int], deck:[Int])->Bool{
    //Baby steps
    //Check first element of the deck. It should be either first element of half1 or half 2
   
    var left:Int = 0
    var right:Int = 0
    
    //iterate through cards
    
    for card in deck{
        if half1.count > left && card == half1[left]{
            
            left += 1
        }
        else if half2.count > right && card == half2[right]{
            
            right += 1
        }
        else{
            print(left)
            print(right)
            return false
        }
    }
    
    return true
}


let half1 = [1,4,6,8]
let half2 = [3,5,10,20]
let deck = [1,4,3,5,6,8,10,20]

singleRifle(half1: half1, half2: half2, deck: deck)

