//: Playground - noun: a place where people can play

import UIKit


protocol MyDelegate:class{
    func doSomething()
}

class Brother{
    weak var delegate:MyDelegate?
    
    init() {
        
    }
    
    func something() {
        //implementation of protocol//delegate
        delegate?.doSomething()
    }
}

class Sister:MyDelegate{
    func doSomething() {
        print("Sister will complain")
    }
}


func countUp(index:Int, countTo:Int){
    if index > countTo{
        return
    }
    else{
        countUp(index: index + 1, countTo: countTo)
        print(index)

    }
}

func countDown(index:Int, countTo:Int){
    if index >= countTo{
        print(index)
        countDown(index: index - 1, countTo: countTo)
    }
    else{
        return
    }
}

countUp(index: 1, countTo: 10)
//countDown(index: 10, countTo: 1)
//let b = Brother()
//let s = Sister()
//b.delegate = s
//b.something()


