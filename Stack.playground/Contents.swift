//: Playground - noun: a place where people can play

import UIKit
import Foundation

class Stack {
    
    var ll: LinkedList
    
    init(top: Node?) {
       ll = LinkedList(head: top)
    }
    
    // add a node to the top of the stack
    func push(_ node: Node) {
        ll.insertNode(node, at: 1)
    }
    
    // remove and return the topmost node from the stack
    func pop() -> Node? {
        
        guard let n = ll.getNode(atPosition: 1) else{
            
            return nil
        }
        ll.delete(val: n.value)
        return n
    }
}


class Node{
    var value:Int
    var next:Node?
    
    init(value:Int){
        self.value = value
    }
}

/**Linked List*/
class LinkedList{
    var head:Node?
    
    init(head:Node?) {
        self.head = head
    }
    
    
    func delete(val:Int){
        var current = head
        var previous:Node?
        while current != nil  {
            if current?.value == val{
                if previous == nil {
                    head = head?.next
                }
                else{
                    previous?.next = current?.next
                }
                
                break
            }
            previous = current
            current = current?.next
        }
    }
    
    func insert2(node:Node, at:Int){
        if at < 1{
            return
        }
        var index = 1
        var current = head
        
        if at == 1{ //update node
            node.next = head
            head = node
        }
        else{
            while current != nil{
                if at == index-1{
                    node.next = current?.next
                    current?.next = node
                    return
                }
                index += 1
                current = current?.next
            }
        }
    }
    
    func insert1(node:Node, at:Int){
        if at < 1{
            return
        }
        var index = 1
        var current = head
        var previous = head
        if at == 1{ //update node
            node.next = head
            head = node
        }
        else{
            while current != nil{
                if at == index{
                    node.next = current
                    previous?.next = node
                    return
                }
                index += 1
                previous = current
                current = current?.next
            }
        }
    }
    
    
    func append(_ node:Node){
        //Case if head is nil
        guard head  != nil else {
            head = node
            return
        }
        //Redundant alternative to guard statement above
        if head == nil{
            head = node
            return
        }
        
        
        var current = head
        while let n = current?.next{
            current = n
        }
        current?.next = node
    }
    /**Prints contents of the LL*/
    func printList(){
        var current = head
        while let n = current
        {
            print(n.value)
            current = n.next
        }
    }
    
    
    
    
    
    
    func getNode(atPosition position:Int)->Node?{
        //check position > 0
        if position < 1{
            return nil
        }
        
        var current = head
        var index = 1
        while current != nil{
            if index == position{
                return current
            }
            current = current?.next
            index += 1
        }
        return nil
    }
    
    
    
    
    
    func getNode1(atPosition position:Int)->Node?{
        var currentIndex = 1
        
        guard position >= 1 else{
            return nil
        }
        
        guard head != nil else{
            return nil
        }
        
        var current = head
        while let n = current {
            if currentIndex == position{
                return n
            }
            
            current = n.next
            currentIndex += 1
        }
        return nil
    }
    
    func deleteNode(withValue value: Int) {
        var current = head
        var previous = head
        
        
        if let k = current?.value,  k == value{
            head = head?.next
        }
        
        
        while let n = current?.next {
            
            if  let v = current?.value, v == value{
                //delete reference
                previous?.next = n
                return
            }
            previous = current
            current = current?.next
        }
        
        if  let v = current?.value, v == value{
            //delete reference
            previous?.next = nil
            return
        }
        
    }
    
    
    func insertNode(_ node:Node, at:Int){
        var currentIndex = 1
        var current = head
        var previous = head
        
        guard at > 0 else{
            return
        }
        
        if at == 1
        {
            node.next = head
            head = node
        }
        else{
            while let _ = current {
                
                if currentIndex == at{
                    //insert
                    previous?.next = node
                    node.next = current
                    break
                }
                previous = current
                current = current?.next
                currentIndex += 1
            }
        }
    }
    
}


// Test cases
// Set up some nodes
let n1 = Node(value: 1)
let n2 = Node(value: 2)
let n3 = Node(value: 3)
let n4 = Node(value: 4)

// Start setting up a Stack
let stack = Stack(top: n1)

// Test stack functionality

 stack.push(n2)
 stack.push(n3)
 print(stack.pop()!.value) // Should be 3
 print(stack.pop()!.value) // Should be 2
 print(stack.pop()!.value) // Should be 1
 print(stack.pop()?.value) // Should be nil
 stack.push(n4)
 print(stack.pop()!.value) // Should be 4

