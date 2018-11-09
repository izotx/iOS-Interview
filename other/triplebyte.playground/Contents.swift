import UIKit
/**
 Implement a queue ↴ with 2 stacks. ↴ Your queue should have an enqueue and a dequeue method and it should be "first in first out" (FIFO).
 */

//Stack has two operations
// push and pop
//Queue has two operations enqueue and dequeue

struct Queue{
    var enqueStack = [Int]()
    var dequeStack = [Int]()
    
    mutating func enqueue(a:Int){
        //add to the stack
        enqueStack.append(a)
    }

    
    //remove to the stack
    //But we want to remove the first not
    mutating func dequeue()->Int?{
        guard let last = dequeStack.last else{
            return nil
        }
        return last
    }
    
}

