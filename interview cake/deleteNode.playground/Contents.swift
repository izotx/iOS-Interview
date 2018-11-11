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

let a = LinkedListNode("A")
let b = LinkedListNode("B")
let c = LinkedListNode("C")

a.next = b
b.next = c


func deleteNode(_ node:LinkedListNode<String>)throws{
    //There are
    
    guard let next = node.next else{
        throw LinkedError.End
    }

    node.value = next.value
    node.next = next.next
    
}

try deleteNode(b)
