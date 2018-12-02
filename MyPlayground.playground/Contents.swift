import UIKit

class Node{
    var value:Int;
    init(_ value:Int) {
        self.value = value
    }
    var next:Node?;
}


class LinkedList
{
    var root:Node?
    
    func deleteNode(value:Int)->Bool{
        //Look for all
        guard let r = root else {
            return false
        }
        if r.value == value{
            root = root?.next
            return true
        }
        
        var node:Node? = r;
        var previous:Node?
        while node != nil{
            if node!.value == value{
                previous!.next = node!.next
                
                return true
            }
            
            previous = node
            node = node!.next
            
        }
        return false
    }

}




func sum(){
    
}
