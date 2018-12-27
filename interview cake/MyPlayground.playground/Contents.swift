import UIKit

/*Write an efficient function that takes stockPrices and returns the best profit I could have made from one purchase and one sale of one share of Apple stock yesterday.*/
func getMaxProfit(_ prices:[Double])->Double{
    //we need to track a difference
    guard prices.count > 0 else{
        return 0
    }
    
    var priceDifference = 0.0
    
    for time in 0..<prices.count{
        let price = prices[time]
        for laterTime in time + 1..<prices.count{
            let laterPrice = prices[laterTime]
            if (laterPrice - price) > priceDifference{
                priceDifference = (laterPrice - price)
            }
        }
    }
    return priceDifference
}

let stockPrices:[Double] = [10, 7, 5, 8, 11, 9]
getMaxProfit(stockPrices)

