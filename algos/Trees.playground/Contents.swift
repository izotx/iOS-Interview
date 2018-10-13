
//: Playground - noun: a place where people can play

import UIKit

class Node:CustomStringConvertible{
    
    var value: Int?
    var edges: [Edge]
    var visited = false
    
    init(value: Int?) {
        self.value = value
        self.edges = []
    }
    
    var description: String{
        return "\(self.value!)"
    }
}

class Edge {
    
    var value: Int?
    var nodeFrom: Node?
    var nodeTo: Node?
    
    init(value: Int?, nodeFrom: Node?, nodeTo: Node?) {
        self.value = value
        self.nodeFrom = nodeFrom
        self.nodeTo = nodeTo
    }
}

class Graph {
    
    var nodes: [Node]
    var edges: [Edge]
    
    init(nodes: [Node], edges: [Edge]) {
        self.nodes = nodes
        self.edges = edges
    }
    
    // Create a recursive implementation.
    // Return a list of the node values.
    func dfs(_ startNode: Node) -> [Int] {
        let visited = [startNode.value!]
        
        return dfsHelper(startNode, visited: visited)

    }
    
    // Create an iterative implementation.
    // Return a list of the node values.
    func bfs(_ startNode: Node) -> [Int] {
        var toBeVisited = [Node]()
        var visited = [Int]()
        toBeVisited.append(startNode)

        while !toBeVisited.isEmpty
        {
            
           let node = toBeVisited.removeFirst()
            node.visited = true
            print(node.value)
            visited.append(node.value!)

           // print(node.edges)
            
            for e in node.edges{
                if !(e.nodeTo!.visited){
                    toBeVisited.append(e.nodeTo!)
                }
            }
            print(toBeVisited)
        }
        
        return visited
    }
    
    // helper method - use to implement DFS recursively
    func dfsHelper(_ current: Node, visited: [Int]) -> [Int] {
        var result = visited
        
       // current.visited = true

        for e in current.edges{
            if !result.contains((e.nodeTo?.value)!){
                result.append(e.nodeTo!.value!)
                result = dfsHelper(e.nodeTo!, visited: result)
            }
        }
        
        
        return result
    }
    
    // creates a now with a given value and inserts it into the graph
    func insertNodeWithValue(_ value: Int) {
        let newNode = Node(value: value)
        nodes.append(newNode)
    }
    
    // inserts an edge between the "to" and "from" nodes with the given value
    func insertEdgeWithValue(_ newEdgeValue: Int, nodeFromValue: Int, nodeToValue: Int) {
        var fromFound: Node? = nil
        var toFound: Node? = nil
        
        for node in nodes {
            if nodeFromValue == node.value {
                fromFound = node
            }
            if nodeToValue == node.value {
                toFound = node
            }
        }
        
        if fromFound == nil {
            fromFound = Node(value: nodeFromValue)
            nodes.append(fromFound!)
        }
        if toFound == nil {
            toFound = Node(value: nodeToValue)
            nodes.append(toFound!)
        }
        
        let newEdge = Edge(value: newEdgeValue, nodeFrom: fromFound, nodeTo: toFound)
        fromFound?.edges.append(newEdge)
        toFound?.edges.append(newEdge)
        edges.append(newEdge)
    }
}

//Test cases
let graph = Graph(nodes: [], edges: [])
graph.insertEdgeWithValue(100, nodeFromValue: 1, nodeToValue: 2)
graph.insertEdgeWithValue(101, nodeFromValue: 1, nodeToValue: 3)
graph.insertEdgeWithValue(102, nodeFromValue: 1, nodeToValue: 4)
graph.insertEdgeWithValue(103, nodeFromValue: 3, nodeToValue: 4)

print(graph.dfs(graph.nodes[0])) // Should be [1, 2, 3, 4]
print(graph.bfs(graph.nodes[0])) // Should be [1, 2, 3, 4]
