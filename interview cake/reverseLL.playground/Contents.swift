//: Playground - noun: a place where people can play

import UIKit

enum LinkedError:Error, CustomStringConvertible{
    var description: String{
        switch self {
        case .End:
            return "End"
        default:
            return "Error "
        }
    }
    case End
}

class LinkedListNode<Value: Equatable>:Equatable {
    
    var value: Value
    var next: LinkedListNode?
    
    init(_ value: Value) {
        self.value = value
    }

    static func == (lhs: LinkedListNode, rhs:  LinkedListNode) -> Bool {
        return
        lhs.next == rhs.next && lhs.value == rhs.value
    }
    
}



extension LinkedListNode{
    
  
    
    func detectCycle<T>( node:inout LinkedListNode<T>)-> Bool{
        var set = [LinkedListNode<T>]()
        var currentNode:LinkedListNode<T>? = node
        while currentNode != nil {
            if  set.contains(node){
                return true
            }
            else{
                set.append(currentNode!)
            }
            currentNode = currentNode!.next
        }
        return false 
    }
}
