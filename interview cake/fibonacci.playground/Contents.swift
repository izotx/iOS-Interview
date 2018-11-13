import UIKit

enum FibberError: Error, CustomStringConvertible {
    case negativeIndex
    
    var description: String {
        return "Index was negative. No such thing as a negative index in a series."
    }
}

var memo = [Int:Int]()
func fib(_ n: Int)->Int{
    guard n > 0 else{
        return n
    }
    
    if(n == 0 || n == 1){
        return 1
    }
    
    if let k = memo[n]
    {
        return k
    }


    memo[n] = fib(n - 1) + fib(n - 2)
    return memo[n]!
}

fib(3)
fib(6)
