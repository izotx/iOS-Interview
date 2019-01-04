import UIKit

class BinaryTreeNode {
    
    var value: Int
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    
    init(_ value: Int) {
        self.value = value
    }
    
    func insert(leftValue: Int) -> BinaryTreeNode {
        left = BinaryTreeNode(leftValue)
        return left!
    }
    
    func insert(rightValue: Int) -> BinaryTreeNode {
        right = BinaryTreeNode(rightValue)
        return right!
    }
}


func largest(node:BinaryTreeNode)->BinaryTreeNode?{
    var root:BinaryTreeNode? = node;
    var previous: BinaryTreeNode?
    while root != nil{
        previous = root;
        root = root?.right
    }
    return previous;
}


let tree = BinaryTreeNode(5)
let n1 = BinaryTreeNode(8)
let n2 = BinaryTreeNode(4)
let n3 = BinaryTreeNode(6)
let n4 = BinaryTreeNode(3)
tree.left = n4
tree.right = n2
n2.right = n3
n3.right = n1

//let node = largest(node: tree)
//print(node?.value)


//func findLargest(root:BinaryTreeNode)->Int{
//
//    if let right = root.right{
//      // return
//        print(right.value)
//        findLargest(root: right)
//    }
//    print("R V \(root.value)")
//    return root.value
//}

//let node1 = findLargest(root: tree)
//print(node1)


enum SearchError:Error,CustomDebugStringConvertible{
    var debugDescription: String{
        return description
    }
    
    case emptyTree
    case lessThanTwoNodes

    var description: String {
        switch self {
        case .emptyTree:
            return "Tree must have at least 1 node"
        case .lessThanTwoNodes:
            return "Tree must have at least 2 nodes"
        }
    }
}




func find2ndLargest(root:BinaryTreeNode?) throws {
    guard let node = root else{
        throw SearchError.emptyTree
    }
    
    if node.left == nil && node.right == nil {
        throw SearchError.lessThanTwoNodes
    }
    
    // find the rightmost?
    // find the parent of it
    // if it has left go left
    // if it doesn't have left return left
    var cnode:BinaryTreeNode = node;
    var previous:BinaryTreeNode?
    
    //That's how you find the largest element
    while cnode != nil {
       
        previous = cnode
        cnode = cnode!.right
    }
    
    if(previous?.left == nil){
        
    }
    
    
    
}

func findLargest2(root:BinaryTreeNode)->Int{
    
    if let r = root.right {
        print(r.value)
        return findLargest2(root: r)
    }

       print(root.value)
       return root.value

}

let node2 = findLargest2(root: tree)
print(node2)


