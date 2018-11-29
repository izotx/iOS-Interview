//: Playground - noun: a place where people can play

import UIKit

class LinkedListNode<Value: Equatable> {
    
    var value: Value
    var next: LinkedListNode?
    
    init(_ value: Value) {
        self.value = value
    }
}

func reverseLL<T>(node:LinkedListNode<T>){
    var n:LinkedListNode<T>? = node
    var head:LinkedListNode<T>? = node
    x x
    x
     while n != nil{
        
        head.next = n
        n = n!.next
        head = n
    }
    
}
