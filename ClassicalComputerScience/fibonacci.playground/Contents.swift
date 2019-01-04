import UIKit

func fibonacci(n:Int)->Int{
    
    if n < 2 {
        return n
    }
    
  return  fibonacci(n: n - 1) + fibonacci(n: n-2)
}




var n1 = fibonacci(n: 1)
var n3 = fibonacci(n: 3)
var n4 = fibonacci(n: 9)

