//: Playground - noun: a place where people can play

import UIKit

class Node{
    let value:Int
    var next:Node?

    init(val:Int) {
        self.value = val
    }
}

func append(head:Node, node:Node){
    var h = head
    //Find empty and instert
    while(h.next != nil){
        h = h.next!
    }
    h.next = node
}

func delete(head:Node, node:Node)->Node?{
    var h = head
    if(h.value == node.value){
        return head.next
    }
    while h.next != nil{
        if(h.value == node.value){
            h.next  = h.next?.next
            return h
        }
        h = h.next!
    }
    return head
}

//2.1
func removeDuplicates(node:Node){
    var set = Set<Int>()
    var h = node
    
    while h.next != nil {
        if set.contains(h.value){
            //Remove node
            h.next = h.next!.next
        }
        else{
            //add to set
            set.insert(h.value)
        }
        //and move on
        h = h.next!
    }
}
//2.2
func removeDuplicatesNoStructures(node:Node){
   
    var h = node
    
    while h.next != nil {
        var runner = h
        while runner.next != nil {
            if runner.value == h.value{
                runner.next = runner.next?.next
            }
                runner = runner.next!
        }
        h = h.next!
    }
}

//2.3 Return kth to last

func printKthToLast(_ node:Node?,_ index:Int)->Int{
    if node == nil{
        return 0
    }
    let i = printKthToLast(node?.next, index) + 1
    if(i == index){
        print(node?.value)
    }
    
    return i
    
}



