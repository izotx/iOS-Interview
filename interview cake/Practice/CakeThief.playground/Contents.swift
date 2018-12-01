import UIKit
/**
 You are a renowned thief who has recently switched from stealing precious metals to stealing cakes because of the insane profit margins. You end up hitting the jackpot, breaking into the world's largest privately owned stock of cakes—the vault of the Queen of England.
 
 While Queen Elizabeth has a limited number of types of cake, she has an unlimited supply of each type.
 
 Each type of cake has a weight and a value, stored in objects of a CakeType struct:
 */

 struct CakeType {
 let weight: UInt
 let value: UInt
 }

/*
 Swift
 For example:
 
 // weighs 7 kilograms and has a value of 160 shillings
 CakeType(weight: 7, value: 160)
 
 // weighs 3 kilograms and has a value of 90 shillings
 CakeType(weight: 3, value: 90)
 
 You brought a duffel bag that can hold limited weight, and you want to make off with the most valuable haul possible.
 
 Write a function maxDuffelBagValue() that takes an array of cake type structs and a weight capacity, and returns the maximum monetary value the duffel bag can hold.
 */
func  maxDuffelBagValue(_ cakes:[CakeType], _ weight:UInt)->UInt{
    ///we need to check all combinations that don't oveflow
    // N!
    // take first and see if we add others if it will overflow, keeping max value
    var maxValue:UInt = 0;
    for i in 0..<cakes.count
    {   var tempSum:UInt = 0
        var tempWeight:UInt = 0
        let cake1 = cakes[i]
        if cake1.weight >  weight{
            continue
        }

        tempWeight = cake1.weight
        tempSum = cake1.value
        
        for j in 0..<cakes.count
        {
            if i == j{
                continue
            }
            let cake2 = cakes[j]
            if tempWeight + cake2.weight <= weight{
                tempWeight += cake2.weight
                tempSum  += cake2.value
                maxValue = UInt(max(Int(tempSum),Int(maxValue)))
            }
        }
    }
    
    
    
    return maxValue
}
let cakeTypes = [
    CakeType(weight: 7, value: 160),
    CakeType(weight: 3, value: 90),
    CakeType(weight: 2, value: 15)
]

let capacity:UInt = 20
maxDuffelBagValue(cakeTypes, capacity)
