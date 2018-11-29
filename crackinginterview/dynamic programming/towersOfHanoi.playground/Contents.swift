//: Playground - noun: a place where people can play

import UIKit

//
class Tower{
    private let stack:Stack // We will store the discs here
    private var index:Int // ???
    
    init(stack:Stack, index:Int) {
        self.stack = stack
        self.index = index
    }

    func add(disc:Disc){
        if let top = stack.peek() && top.value > disc.value{
            print("Errror")
        }
        else{
            print("Pushing Disks \(disc.value)")
            stack.push(disc)
        }
    }
    
    func moveTopTo(Tower:t){
        if let disc = stack.pop(){
            t.add(disc)
        }
        
    }
    
}

struct Disc{
    let value:Int
}


class Stack{
    var array: [Int]
    func push(_ element:Disc){
            self.array.append(element)
    }
    
    init() {
        array = []()
    }
    
    
    func pop()->Disc?{
        guard self.array.count > 0 else{
            return nil
        }
        return array.removeLast()
    }
    
    func peek()->Disc?{
        return array.last
    }
    
}
