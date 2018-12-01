import UIKit

var dict = [Int:Int]()

func fibonacci(_ fib:Int)->Int{
    if(fib == 0){
        return 0
    }
    if(fib == 1){
        return 1
    }

    if dict[fib - 2] == nil{
        dict[fib-2] = fibonacci(fib - 2)
    }
    if dict[fib - 1] == nil{
        dict[fib-1] = fibonacci(fib - 1)
    }
    
    return dict[fib - 2]! + dict[fib - 1]!
}

func iterativeFibonacci(_ fib:Int)->Int{
    if(fib == 0){
        return 0
    }
    if(fib == 1){
        return 1
    }
    //2 1, 3 2  3, 4
    
    
    var prevPrev: UInt = 0  // 0th fibonacci
    var prev: UInt = 1      // 1st fibonacci
    var current: UInt = 0   // Declare and initialize current
    
    for _ in 1..<fib {
        
        // Iteration 1: current = 2nd fibonacci
        // Iteration 2: current = 3rd fibonacci
        // Iteration 3: current = 4th fibonacci
        // To get nth fibonacci ... do n-1 iterations.
        current = prev + prevPrev
        prevPrev = prev
        prev = current
    }

    
    return 0
    
}


fibonacci(3)
