//
//  main.swift
//  Kruskals-MST
//
//  Created by Yash Jivani on 06/08/21.
//

import Foundation

class Edge{
    let src: Int
    let dest: Int
    let weight: Int
    
    init(src: Int, dest: Int, weight: Int) {
        self.src = src
        self.dest = dest
        self.weight = weight
    }
}

extension Edge: Comparable{
    static func < (lhs: Edge, rhs: Edge) -> Bool{
        return lhs.weight < rhs.weight
    }
}
extension Edge: Equatable {
    static func == (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.src == rhs.src && lhs.dest == rhs.dest
    }
}

class Graph{
    var vertexCount : Int
    var edgeCount: Int
    var edges : [Edge]
    var subsets: [Subset]
    init(vertexCount: Int, edgeCount: Int) {
        self.edgeCount = edgeCount
        self.vertexCount = vertexCount
        self.edges = [Edge]()
        self.subsets = [Subset]()
        
    }
    
    func addEdge(src: Int, dest: Int, weight: Int){
        let edge = Edge(src: src, dest: dest, weight: weight)
        self.edges.append(edge)
    }
    
    func find(node: Int) -> Int{
        if self.subsets[node].parent != node{
            self.subsets[node].parent = self.find(node: subsets[node].parent)
        }
        return self.subsets[node].parent
    }
    
    func union(nodeX: Int, nodeY: Int){
        let xroot = self.find(node: nodeX)
        let yroot = self.find(node: nodeY)
        
        if subsets[xroot].rank < subsets[yroot].rank{
            subsets[xroot].parent = subsets[yroot].parent
        }else if subsets[yroot].rank < subsets[xroot].rank{
            subsets[yroot].parent = subsets[xroot].parent
        }else{
            subsets[yroot].parent = xroot
            subsets[xroot].rank += 1
        }
    }
    
    func krushkalMST(){
        var result = [Edge]()
        self.edges.sort()
        let edgeCount = 0
        var edgeIndex = 0
        for i in 0..<vertexCount{
            subsets.append(Subset(parent: i, rank: 0))
        }
        
        while edgeCount < self.vertexCount - 1 && edgeIndex < self.edgeCount{
            
            let nextEdge = self.edges[edgeIndex]
            edgeIndex += 1
            let x = find(node: nextEdge.src)
            let y = find(node: nextEdge.dest)
            
            if(x != y){
                result.append(nextEdge)
                self.union(nodeX: x, nodeY: y)
            }
        }
        
        print("Following are the edges in the constructed MST")
        
        var minCost = 0
        for edge in result{
            print("\(edge.src) -- \(edge.dest) == \(edge.weight) ")
            minCost += edge.weight
        }
        
        print("Weight of minimum Spanning tree \(minCost)")
        
    }
}

class Subset{
    var parent: Int
    var rank: Int
    
    init(parent: Int, rank: Int) {
        self.parent = parent
        self.rank = rank
    }
}


let graph = Graph(vertexCount: 4, edgeCount: 5)

graph.addEdge(src: 0, dest: 1, weight: 10)
graph.addEdge(src: 0, dest: 2, weight: 6)
graph.addEdge(src: 0, dest: 3, weight: 5)
graph.addEdge(src: 1, dest: 3, weight: 15)
graph.addEdge(src: 2, dest: 3, weight: 4)
graph.krushkalMST()

