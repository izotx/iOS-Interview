//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


extension Array where Element: Comparable{
mutating  func bubbleSort(){
        for x in 0..<self.count{
            for y in 0..<self.count - 1{
                //Check two elements
                let temp1 = self[y]
                let temp2 = self[y + 1]

                //Compare
                if(temp2<temp1){
                    self[y] = temp2
                    self[y+1] = temp1
                }
                
            }
        }
    }
}










func fib(_ position:Int)->Int{
//    print(position)
    if position == 0 || position == 1{
        return position
    }
    
    return fib(position - 2) + fib(position - 1)
}

//fib(1)
//fib(5)

//
//class GCD:UIViewController{
//
//    func testGCD(){
//        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
//            guard let s = self else {
//                return
//            }
//
//            // 2
//            DispatchQueue.main.async { [weak self] in
//                // 3
//            }
//        }
//    }
//    func testGCD2(){
//        DispatchQueue.main.async {
//                            // App will crash
//            print("AA")
//        }
//
//        DispatchQueue.global(qos: .utility).sync {
//            // Background Task
//            if (Thread.isMainThread){
//                print("Main")
//            }
////
////            DispatchQueue.main.sync {
////                // App will crash
////            }
//        }
//    }
//}
//
//
//let g = GCD()
//g.testGCD2()


