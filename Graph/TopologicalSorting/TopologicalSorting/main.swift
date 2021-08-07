//
//  main.swift
//  TopologicalSorting
//
//  Created by Yash Jivani on 07/08/21.
//

import Foundation

class Graph{
    var vertexCount: Int
    var graph: [[Int]]
    
    init(count: Int) {
        self.vertexCount = count
        self.graph = [[Int]](repeating: [Int](), count: count)
    }
    
    func addEdge(src: Int, dest: Int){
        self.graph[src].append(dest)
    }
    
    func topologicalSortUtil(vertex: Int, visited: inout [Bool], stack: inout [Int]){
       
        visited[vertex] = true
        for i in self.graph[vertex]{
            if !visited[i]{
                topologicalSortUtil(vertex: i, visited: &visited, stack: &stack)
            }
        }
        
        stack.append(vertex)
    }
    
    func topologicalSortt(){
        var stack = [Int]()
        var visited = [Bool](repeating: false, count: self.vertexCount)
        
        for i in 0..<self.vertexCount{
            if !visited[i]{
                self.topologicalSortUtil(vertex: i, visited: &visited, stack: &stack)
            }
        }
        
        while !stack.isEmpty {
            print("\(stack[stack.count - 1]) ", terminator: " ")
            stack.remove(at: stack.count - 1)
        }
    }
}


let graph = Graph(count: 6)
graph.addEdge(src: 5, dest: 2)
graph.addEdge(src: 5, dest: 0)
graph.addEdge(src: 4, dest: 0)
graph.addEdge(src: 4, dest: 1)
graph.addEdge(src: 2, dest: 3)
graph.addEdge(src: 3, dest: 1)

graph.topologicalSortt()
