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
    
    if(deck.count == 0 ){
        return true
    }
    
    let topDeck = deck[0]

    //pop deck
    var newDeck =  popOne(deck)
    print(half1)
    print(half2)
    
    
    if(!half1.isEmpty){
         let topHalf1 = half1[0]
        if(topDeck == topHalf1){
            
            var nhalf1 = popOne(half1)
            return singleRifle(half1: nhalf1, half2: half2, deck:newDeck )
        }
    }
    if (!half2.isEmpty){
        let topHalf2 = half2[0]
        if(topDeck == topHalf2){
            var nhalf2 = popOne(half2)
            return singleRifle(half1: half1, half2: nhalf2, deck:newDeck )
        }
    }
    
    return false
}


let half1 = [1,4,6,8]
let half2 = [3,5,10,20]
let deck = [1,4,3,5,6,8,20,10]

singleRifle(half1: half1, half2: half2, deck: deck)

