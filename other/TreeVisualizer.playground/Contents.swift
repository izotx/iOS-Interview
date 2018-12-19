import UIKit

var str = "Hello, playground"
struct Cord{
    var x:CGFloat
    var y:CGFloat
}

class Node<Value:Comparable>{
    var children = [Node]()
    var parent:Node?
    var cords = Cord(x: 0, y: 0)
    var value:Value
    var order:Int = 0
    var mod:CGFloat = 0
    
    func insert(_ node:Node){
        children.append(node)
    }
    
    init(_ val:Value) {
        self.value = val
    }

    
    func isLeftMost()->Bool{
        if let parent = parent{
            return parent.children[0] == self
        }
        return true
    }
}

extension Node: Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.value == rhs.value
            && lhs.children == rhs.children
    }
}

class LevelNode<Value:Comparable>:Node<Value>{
    var level:Int = 0
    
    func insert(_ node:LevelNode){
        children.append(node)
        node.level = self.level + 1
    }
}

let n1 = LevelNode(1)
let n2 = LevelNode(2)
let n3 = LevelNode(3)
let n4 = LevelNode(4)
let n5 = LevelNode(5)
let n6 = LevelNode(6)
let n7 = LevelNode(7)
let n8 = LevelNode(8)

n1.insert(n2)
n1.insert(n3)
n3.insert(n4)
n3.insert(n5)
n5.insert(n6)
n5.insert(n7)
n5.insert(n8)



class Stack<Value>{
    private var array = [Value]()
    func push(_ val:Value ){
        array.append(val)
    }
    
    func pop()->Value?{
        guard array.last != nil else{
            return nil;
        }
        return array.removeLast()
    }
    
    func peek()->Value?{
        return array.last
    }
}


class Queue<Value>{
    private var array = [Value]()
    func enqueue(_ val:Value ){
        array.append(val)
    }
    
    func deque()->Value?{
        guard array.first != nil else{
            return nil;
        }
        return array.removeFirst()
    }
    
    func peek()->Value?{
        return array.first
    }
}

/**Returns Number of levels in the tree based on: breadthSearch*/
func assignLevel(_ root:LevelNode<Int>)->Int{
    let stack = Stack<LevelNode<Int>>()
    root.level = 0
    stack.push(root)
    var maxLevel = 0
    while stack.peek() != nil{
        if let node = stack.pop(){
            for child in node.children{
              
                (child as! LevelNode).level = node.level + 1
                maxLevel = max(maxLevel, node.level + 1)
                stack.push(child as! LevelNode<Int>)
            }
        }
    }
    return maxLevel
}

func getMaxNumberOfChildren(_ root:Node<Int>)->Int{
    let stack = Stack<Node<Int>>()
    stack.push(root)
    var maxChildren = 1
    
    while stack.peek() != nil{
        if let node = stack.pop(){
             maxChildren = max(maxChildren, node.children.count)
            for child in node.children{
                stack.push(child as! LevelNode<Int>)
            }
        }
    }
    return maxChildren
}

func calculateMaxTotalWidth(node:LevelNode<Int>, nodeWidth:CGFloat, space:CGFloat)->CGFloat{
    let levels:Double =  Double(assignLevel(node))
    let maxChildren:Double =  Double(getMaxNumberOfChildren(node))

    let lowestLevelMaxNumberNodes = CGFloat(pow(maxChildren, levels))
    let width = (lowestLevelMaxNumberNodes * nodeWidth) + (lowestLevelMaxNumberNodes - 1) * nodeWidth
    
    return width
}

func calculateMaxNodeWidth(node:Node<Int>,nodeWidth:CGFloat)->CGFloat{
    let maxChildren =  CGFloat(getMaxNumberOfChildren(node))
    return (maxChildren * nodeWidth) + (maxChildren - 1) * nodeWidth
}


func assignX(node:Node<Int>,center:CGFloat, space:CGFloat, nodeWidth:CGFloat){
   let totalAvailableSpace = calculateMaxNodeWidth(node: node, nodeWidth: nodeWidth)
   let space = totalAvailableSpace / CGFloat(node.children.count)
   let startX = center - totalAvailableSpace/2.0
    
    //Assign x to each of the children?
    for index in 0..<node.children.count{
        let x = startX + (CGFloat(index) * space) - space/2.0
        node.children[index].cords.x = x
    }
}

typealias Levels = [Int:[LevelNode<Int>]]

func groupLevels(node:LevelNode<Int>)->Levels{
    let stack = Stack<LevelNode<Int>>()
    stack.push(node)
    var levels = [Int:[LevelNode<Int>]]()
    while stack.peek() != nil{
        
        if let node = stack.pop(){
            if let _ =   levels[node.level]{
            }
            else{
                levels[node.level] = [LevelNode]()
            }
                levels[node.level]!.append(node)

            
            for child in node.children{
                stack.push(child as! LevelNode<Int>)
            }
        }
    }
    return levels;
}


func assignXY(node:LevelNode<Int>, center:CGFloat, space:CGFloat, nodeHeight:CGFloat){
    let stack = Stack<LevelNode<Int>>()
    stack.push(node)
    //level 0 1 node occupating max space (In Center)
    //level 1 2 nodes occupating max space
    //level 2 4 nodes occupating max space

    //get all nodes on given level? and assign x to them from left to right?
    //
    
    while stack.peek() != nil{
        
        if let node = stack.pop(){
            //level 0
            //
            node.cords.y = CGFloat(node.level) * nodeHeight + CGFloat(node.level) * space
            //Depending on the level we can calculate available space and center
            
            if(node.level == 0){
                //node.cords.x = center - space.2.0
            }
    
            for child in node.children{
                stack.push(child as! LevelNode<Int>)
            }
        }
    }
}


//let k:CGFloat = 2.1
//var c:CGFloat = CGFloat(10) / k
//
//assignLevel(n1)
//let levels = groupLevels(node: n1)


//calculateMaxWidth(node: n1, nodeWidth: 50,space: 10)

func preOrder(_ root:LevelNode<Int>?){
    if let root = root{
        for (index,child) in root.children.enumerated(){
            child.order = index
            preOrder(child as? LevelNode<Int>)
        }
    }
}
let space: CGFloat = 10

func assignInitialX(_ root:LevelNode<Int>?){
    if let root = root{
        for (index,child) in root.children.enumerated(){
            if index == 0{
                child.cords.x = CGFloat(index)
            }
            else{
                child.cords.x = CGFloat(index) + space
            }

            assignInitialX(child as? LevelNode<Int>)
        }
    }
}

func centerOverChildren(_ root:LevelNode<Int>?){
    guard let root = root else{
        return
    }
    
    for (_,child) in root.children.enumerated(){
        centerOverChildren(child as? LevelNode<Int>)
    }
    if root.children.count == 0{
        
    }
    else if root.children.count == 1 {
        root.cords.x = root.children[0].cords.x
    }
    else{
        //get first
         let first = root.children.first!.cords.x
         let last = root.children.last!.cords.x
         root.cords.x = (first + last) / 2.0
         root.mod = root.cords.x - first
    }
}




func printTree(node:LevelNode<Int>){
    let queue = Queue<LevelNode<Int>>()
    queue.enqueue(node)
    
    while queue.peek() != nil{
        if let node = queue.deque(){
            print("\(node.value) \(node.level) \(node.order)"  )
            for child in node.children{
                queue.enqueue(child as! LevelNode<Int>)
            }
        }
    }
}




preOrder(n1)
printTree(node: n1)





class Visualizer{

    /*
     0 1 40
     1 4
     2 16
     3 32
     4 64
     */

    
   
}
