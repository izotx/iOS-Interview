//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
class Node{
    var value:Int
    var next:Node?
    
    init(value:Int){
        self.value = value
    }
}


class LinkedList{
    var head:Node?
    
    init(head:Node?) {
        self.head = head
    }
    
    func append(_ node:Node){

        //Case if head is nil
        guard head  != nil else {
            head = node
            return
        }
        
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
    
    func printList(){
        var current = head
        while let n = current
        {
            print(n.value)
            current = n.next
        }
    }
    
    func getNode(atPosition position:Int)->Node?{
        var currentIndex = 1
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
        var last = head
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
        
        //Three scenarios
        //At the beginning
        //At the end
        //In the middle
     
        var current = head
        var last = head
        var previous = head
        
        if at == 1{
            node.next = head
            self.head = node
            return
        }
        
        while let n = current?.next {
            
            if currentIndex == at{
                //insert
                previous?.next = node
                node.next = current
                return
            }
            previous = current
            current = current?.next
            currentIndex += 1
        }
        
        
        //insert at the end
        if currentIndex == at{

            current?.next = node
        }
        else{
            print("outside bounds")
        }
        
    }
}


// Test cases
 // Set up some Nodes
 let n1 = Node(value: 1)
 let n2 = Node(value: 2)
 let n3 = Node(value: 3)
 let n4 = Node(value: 4)
 
 // Start setting up a LinkedList
 let ll = LinkedList(head: n1)
 ll.append(n2)
 ll.append(n3)

ll.printList()
print("")

 // Test getNode(atPosition:)
 print(ll.head!.next!.next!.value) // Should print 3
 print(ll.getNode(atPosition: 3)!.value) // Should also print 3
 
 // Test insert
 ll.insertNode(n4, at: 3)
 print(ll.getNode(atPosition: 3)!.value) // Should print 4 now
 
 // Test delete(withValue:)
 ll.deleteNode(withValue: 1)
 print(ll.getNode(atPosition: 1)!.value) // Should print 2 now
 print(ll.getNode(atPosition: 2)!.value) // Should print 4 now
 print(ll.getNode(atPosition: 3)!.value) // Should print 3
 



//let head = Node(value: 10)
//var n1 = Node(value: 1)
//var ll = LinkedList(head:head)
//
//ll.appendNode(node:n1)
//
////print(ll)
//ll.appendNode(node: Node(value: 3))
//ll.printList()
////let k = ll.getNode(atPosition: 2)
////print(k?.value)
//
//print("Insert 4")
//ll.insertNode(Node(value:4), at: 1)
//ll.printList()
//print("Insert 5")
//ll.insertNode(Node(value:5), at: 2)
//ll.printList()
//
//print("Insert 7")
//ll.insertNode(Node(value:7), at: 6)
//ll.printList()
//
//print("Delete 4")
//ll.deleteNode(withValue: 4)
//ll.printList()
//
//print("Delete 1")
//ll.deleteNode(withValue: 1)
//ll.printList()
//
//print("Delete 7")
//ll.deleteNode(withValue: 7)
//ll.printList()






