//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

/*
 Do a post-order traversal of the tree
 Assign an X value to each node of 0 if it’s a left-most node, or leftSibling.X + 1 if it’s not.
 For each parent node, we want the node centered over the children. This would be the midway point between the first child’s X position, and the last child’s X position.
 
 If the parent has no left sibling, change it’s X value to this midpoint value. If it has a left sibling, we’re going to store it in another node property. I’m calling this property Mod just because that’s what I see it called in other examples.
 
 The Mod property is used to determine how much to modify the children’s X values in order to center them under the parent node, and will be used when we’re done with all our calculates to determine the final X value of each node. It should actually be set to Parent.X – MiddleOfChildrenX to determine the correct amount to shift the children by.
 
 Check that this tree does not conflict with any of the previous sibling trees, and adjust the Mod property if needed. This means looping through each Y level in the current node, and checking that the right-most X value of any sibling to the left of the node does not cross the left-most X value of any child in the current node.
 Do a second walk through the tree to determine that no children will be drawn off-screen, and adjust the Mod property if needed. This can happen when if the Mod property is negative.
 Do a third walk through the tree to determine the final X values for each node. This will be the X of the node, plus the sum of all the Mod values of all parent nodes to that node.
 */

struct Dimensions{
    static let horizontalSpace:CGFloat = 100;
    static let verticalSpace:CGFloat = 100
    static let width:CGFloat = 50
    static let height:CGFloat = 50
}



class Node{
    var children:[Node] = [Node]();
    var value:Int
    var frame:CGRect = .zero
    var mod:CGFloat = 0
    init(_ v:Int) {
        self.value = v
    }
}

//class NodeView:UIView{
//    var node:Node
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("Coder Not Implemented")
//    }
//
////    override init(frame: CGRect) {
////        super.init(frame: frame)
////    }
//
//
//    init(frame:CGRect, node:Node){
//        self.node = node
//        super.init(frame: frame)
//    }
//
//}

func postOrderTraversalIterative(root:Node)
{
    var queue:[Node] = [root]
    var depthQueue = [CGFloat(0)]
    
    while !queue.isEmpty{
        let current = queue.removeFirst()
        let depth = depthQueue.removeFirst()

        
        //get children
        for (index, child) in current.children.enumerated(){
            if (index == 0){
                child.frame = CGRect(x: 0, y: (depth + 1) * Dimensions.height , width: Dimensions.width, height: Dimensions.height)
            }else{
                child.frame = CGRect(x: CGFloat(index + 1) * Dimensions.horizontalSpace, y: (depth + 1) * Dimensions.height
                    , width: Dimensions.width, height: Dimensions.height)
            }
             queue.append(child)
             depthQueue.append(depth + 1)
        }

        //Depending on the situation. We will get there in a second
        /*Visit Node
         For each parent node, we want the node centered over the children. This would be the midway point between the first child’s X position, and the last child’s X position.
         The Mod property is used to determine how much to modify the children’s X values in order to center them under the parent node, and will be used when we’re done with all our calculates to determine the final X value of each node. It should actually be set to Parent.X – MiddleOfChildrenX to determine the correct amount to shift the children by.
         */
        //get first child
        if (current.children.count >= 1){
            let first = current.children.first!.frame.minX
            let last = current.children.last!.frame.minX
            
            
            
            current.frame = CGRect(x:  abs(first - last)/2.0, y: depth * Dimensions.height, width: Dimensions.width, height: Dimensions.height)
        }
        else{
            current.frame = CGRect(x:  current.frame.minX, y: depth * Dimensions.height, width: Dimensions.width, height: Dimensions.height)
        }

        
       

  
    }
}

func postOrderTraversal(root:Node?, y:CGFloat){
    guard let node = root else{
        return
    }
    print(y)
    
    //traverse from left to right
    for (index,child) in node.children.enumerated(){
        postOrderTraversal(root: child, y: y + Dimensions.height)
        
        child.frame = CGRect(x: CGFloat(index  + 1) * Dimensions.horizontalSpace, y: y, width: Dimensions.width, height: Dimensions.height)
    }
    
    /*Visit Node
     For each parent node, we want the node centered over the children. This would be the midway point between the first child’s X position, and the last child’s X position.
     The Mod property is used to determine how much to modify the children’s X values in order to center them under the parent node, and will be used when we’re done with all our calculates to determine the final X value of each node. It should actually be set to Parent.X – MiddleOfChildrenX to determine the correct amount to shift the children by.
    */
    node.frame = CGRect(x:  Dimensions.horizontalSpace, y: y, width: Dimensions.width, height: Dimensions.height)
    print(node.frame)
}


func addToView(root:Node){
    var view = UIView(frame: .zero)
    var ymax:CGFloat = 0
    var xmax:CGFloat = 0

    var queue = [Node]()
    queue.append(root)
    while !queue.isEmpty{
        
        //get the last element
        let current = queue.removeFirst()
        print(current.value)
        print(current.frame)
        
        xmax = max(current.frame.maxX, xmax)
        ymax = max(current.frame.maxY, ymax)
        let label = UILabel(frame: current.frame)
        
        label.text = "\(current.value)"
        label.backgroundColor = UIColor.white
        view.addSubview(label)
       
        //get children
        for child in current.children{
            queue.append(child)
        }
    }

    
    view.frame = CGRect(x: 0, y: 0, width: xmax, height: ymax)
    
}



func depthSearchFirst(root:Node){
    var stack = [Node]()
    stack.append(root)
    while !stack.isEmpty{
        //get the last element
        let current = stack.removeLast()
        print(current.value)
        
        //get children
        for child in current.children{
            stack.append(child)
        }

    }
}

func breadthSearchFirst(root:Node){
    var queue = [Node]()
    queue.append(root)
    while !queue.isEmpty{

        //get the last element
        let current = queue.removeFirst()
        print(current.value)
        //get children
        for child in current.children{
            queue.append(child)
        }
        
    }
}

func findHeight(root:Node?)->Int{
    guard let n = root else{
        return 0
    }
    if n.children.isEmpty{
        return findHeight(root: nil) + 1
    }
    
    var results = [Int]()
    for child in n.children{
        results.append(findHeight(root: child) + 1)
    }
    return results.max()!
}


var n1 = Node(0)
var n2 = Node(1)
var n3 = Node(2)
var n4 = Node(3)
var n5 = Node(4)
var n6 = Node(5)
var n7 = Node(6)
var n8 = Node(7)


n1.children.append(contentsOf: [n2,n3])
n2.children.append(contentsOf: [n4,n5])
n3.children.append(n6)
n6.children.append(n7)
n7.children.append(n8)

postOrderTraversalIterative(root: n1)
addToView(root: n1)


//print("Depth")
//depthSearchFirst(root: n1)
//
//print("Breadth")
//breadthSearchFirst(root: n1)
//
//findHeight(root: n1)

