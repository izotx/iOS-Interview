//: Playground - noun: a place where people can play

import UIKit

enum Suit{
    case Clubs, Diamonds, Hearts, Spades
}

struct Card:CustomStringConvertible{
    let suit:Suit
    let value:Int
   
    var description: String {
        return "(\(suit), \(value))"
    }
}

class DeckofCards{
    var deck = [Card]()
    init(cards:[Card]) {

    }
    
    func shuffle(){
        //pick random card and put it in another array until first array is empty
        var newDeck = [Card]()
        while !deck.isEmpty{
            let index = Int(arc4random_uniform(UInt32(deck.count)))
            let card = deck.remove(at: index)
            newDeck.append(card)
        }
        
    }
}
func createDeck(){
    var deck = [Card]()
    for i in 0..<52{
        if i < 13{
            deck.append(Card(suit: .Clubs, value: i + 1))
        }
        else if i < 26 && i >= 13{
            deck.append(Card(suit: .Clubs, value: (i + 1 - 13)))
        }
        else if i < 39 && i >= 26{
            deck.append(Card(suit: .Clubs, value: (i + 1 - 26)))
        }
        else if i >= 39 {
            deck.append(Card(suit: .Clubs, value: (i + 1 - 39)))
        }
     
    }
       print(deck)
}

createDeck()








