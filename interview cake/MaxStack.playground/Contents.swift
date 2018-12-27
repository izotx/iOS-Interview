import UIKit

/*Use your Stack class to implement a new class MaxStack with a method getMax() that returns the largest element in the stack. getMax() should not remove the item.**/
class Stack<Item> {
    
    // initialize an empty array
    private var items: [Item] = []
    
    // push a new item to the last index
    func push(_ item: Item) {
        items.append(item)
    }
    
    // remove the last item
    func pop() -> Item? {
        
        // if the stack is empty, return nil
        // (it would also be reasonable to throw an exception)
        if items.count == 0 {
            return nil
        }
        return items.removeLast()
    }
    
    // see what the last item is
    func peek() -> Item? {
        return items.last
    }
}

class MaxStack<Item:Comparable>:Stack<Item>{
   private  var maxes:Stack<Item> = Stack<Item>()
    
    override func push(_ item:Item){
        super.push(item)
        //check if the last element is bigger than this one
        
        //if not add it to the stack
        if let max = maxes.peek()
        {
            if max <= item{
                maxes.push(item)
            }

        }
        else{
             maxes.push(item)
        }
        
    }

    override func pop() -> Item? {
        if let max = maxes.peek(), let pop = super.pop(){
            if max == pop {
                maxes.pop()
            }
        }

        return super.pop()
    }
    
   func getMax()->Item?{
        return maxes.peek()
    }
}

var maxStack = MaxStack<Int>()
maxStack.push(10)
maxStack.getMax()//10
maxStack.push(5)
maxStack.push(20)
maxStack.getMax()//20
maxStack.pop()
maxStack.getMax()//10
