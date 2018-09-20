//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
class Node{
    var value:Int
    var left:Node?;
    var right:Node?;

    init(_ value:Int) {
        self.value = value
    }
}

class Tree{
    
    
    
}

/**
 
  5
 3  6
2    10
    12  19
 
 */

func searchAll(node:Node?, searchValue:Int)->Bool{
    guard let node = node else{
        return false
    }
    
    if node.value == searchValue{
        return true
    }
  
     return search(node: node.left, searchValue: searchValue) || search(node: node.right, searchValue: searchValue)
    
}

func preorder(_ node:Node?){
    guard let node = node else {
        return
    }
//    if let node = node {
        print(node.value)
        if node.right != nil {
            preorder(node.right)
        }
        if node.left != nil{
         preorder(node.left)
        }

//    }
}


func search(node:Node?, searchValue:Int)->Bool{
    print(node?.value)

    guard let node = node else{
        return false
    }
    
    if node.value == searchValue{
        return true
    }
    if searchValue < node.value{
        return search(node: node.left, searchValue: searchValue)
    }else{
        return search(node: node.right, searchValue: searchValue)
    }
}

var n1 = Node(2)
var n2 = Node(3)
var n0 = Node(5)
var n3 = Node(6)
var n4 = Node(10)
var n5 = Node(19)
var n6 = Node(12)
var n7 = Node(121)

n0.left = n2
n2.left = n1
n2.right = n7
n0.right = n3
n3.right = n4
n4.right = n5
n5.left = n6

//searchAll(node: n0, searchValue: 12 )

preorder(n0)




