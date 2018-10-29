import UIKit

/*
 First, I wanna know how much money I could have made yesterday if I'd been trading Apple stocks all day.
 
 So I grabbed Apple's stock prices from yesterday and put them in an array called stockPrices, where:
 
 The indices are the time (in minutes) past trade opening time, which was 9:30am local time.
 The values are the price (in US dollars) of one share of Apple stock at that time.
 So if the stock cost $500 at 10:30am, that means stockPrices[60] = 500.
 
 Write an efficient function that takes stockPrices and returns the best profit I could have made from one purchase and one sale of one share of Apple stock yesterday.

 */

func getMaxProfit(_ prices:[Int])-> Int{
    //We need to track a maximum difference between high and low price.
//    var high = 0
//    var low = 0
    
    //Check each price and see if and how much profit we can make
    var profit = -Int.max
    for i in 0..<prices.count - 1{
        let buy = prices[i]
        for j in i + 1..<prices.count{
            let sell = prices[j]
            if sell - buy > profit{
                profit = sell - buy
            }
        }
    }
    
    return profit
}

func getBetterMaxProfit(_ prices:[Int])-> Int{
    //We need to track a maximum difference between high and low price.
    //    var high = 0
    //    var low = 0
    
    //Check each price and see if and how much profit we can make
    var profit = -Int.max
    
    
//    for i in 0..<prices.count - 1{
//        let buy = prices[i]
//        for j in i + 1..<prices.count{
//
//        }
//    }
    
    return profit
}


let stockPrices = [10, 7, 5, 8, 11, 9]
getMaxProfit(stockPrices)
