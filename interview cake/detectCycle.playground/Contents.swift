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

class LinkedListNode<Value: Equatable> {
    
    var value: Value
    var next: LinkedListNode?
    
    init(_ value: Value) {
        self.value = value
    }
}

extension LinkedListNode{
    func detectCycle(node:LinkedListNode)-> Bool{
        //if the previous node links to next and next links to previous. So we have to keep reference to previouse node
        var previous:LinkedListNode? = nil
        var currentNode:LinkedListNode? = node
        while currentNode != nil{
            if currentNode?.next == previous?.next{
                return true
            }
            previous = currentNode
            currentNode = currentNode?.next
        }
        return false
    }

}
