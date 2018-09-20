//: Playground - noun: a place where people can play

import UIKit

struct Heap<Element> {
    var elements : [Element]
    let priorityFunction : (Element, Element) -> Bool
    
    // TODO: priority queue functions
    
    var isEmpty : Bool {
        return elements.isEmpty
    }
    
    var count : Int {
        return elements.count
    }
    
    func peek() -> Element? {
        return elements.first
    }
    
    func isRoot(_ index: Int) -> Bool {
        return (index == 0)
    }
    
    func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1
    }
    
    func rightChildIndex(of index: Int) -> Int {
        return (2 * index) + 2
    }
    
    func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
}



