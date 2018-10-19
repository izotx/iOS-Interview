//: Playground - noun: a place where people can play

import UIKit

/*
 The Fibonacci sequence is a series of numbers such that any number, except for the
 first and second, is the sum of the previous two:
 0, 1, 1, 2, 3, 5, 8, 13, 21...
*/

//Space 0(1) Complexity: 2^n
func fib1(_ n:Int)->Int{
    if(n == 0 ){
        return 0
    }
    if(n == 1){
        return 1
    }
    return fib1(n - 1) + fib1(n - 2)
}

fib1(13)

//Memoization Space O(n) complexity logn?
var memo = [Int:Int]()

func fib2(_ n:Int)->Int{
    if let result = memo[n] {
        return result
    }else{
        memo[n] = fib1(n - 1) + fib1(n - 2)
    }
    return memo[n]!
 }

fib2(20)
