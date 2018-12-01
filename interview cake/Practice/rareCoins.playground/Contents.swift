import UIKit

func numberOfWays(amount:Int, denominations:[Int] )->Int{
    /*
     computes the number of ways to make the amount of money with coins of the available denominations.
     */
    
    
    return changePossibilities(amountLeft: amount, denominations: denominations, currentIndex: 0)
}


func changePossibilities(amountLeft:Int, denominations:[Int], currentIndex:Int)->Int{
    //base case
    if amountLeft == 0
    {
        return 1
    }
    
    if amountLeft < 0
    {
        return 0
    }
    
    if currentIndex == denominations.count {
        return 0
    }
    
    
    print("checking ways to make \(amountLeft) with \(denominations[currentIndex..<denominations.count])")
    
    //choose coin
    let currentCoin = denominations[currentIndex]
    
    var numPossibilities = 0
    var amountLeftInner = amountLeft
    while amountLeftInner >= 0 {
        numPossibilities += changePossibilities(amountLeft: amountLeftInner, denominations: denominations, currentIndex: currentIndex + 1)
        amountLeftInner -= currentCoin
    }
    
    return numPossibilities
}

numberOfWays(amount: 4, denominations: [1,2,3])
