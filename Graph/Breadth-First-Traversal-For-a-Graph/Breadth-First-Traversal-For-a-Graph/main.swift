//
//  main.swift
//  Breadth-First-Traversal-For-a-Graph
//
//  Created by Yash Jivani on 06/08/21.
//

import Foundation

class Graph {
    var vertexCount: Int
    var graph: [[Int]]
    
    init(count: Int){
        self.vertexCount = count
        self.graph = [[Int]](repeating: [Int](), count: count)
    }
    
    func addEdge(src: Int, dest: Int){
        self.graph[src].append(dest)
    }
    
    func bfs(source: Int){
        var visited : [Bool] = [Bool](repeating: false, count: self.vertexCount)
        visited[source] = true
        
        var queue = [Int]()
        
        visited[source] = true
        queue.append(source)
        
        while !queue.isEmpty{
            let node = queue.first!
            print("\(node) ", terminator: "")
            queue.remove(at: 0)
            
            for neighbour in self.graph[node]{
                if !visited[neighbour]{
                    visited[neighbour] = true
                    queue.append(neighbour)
                    
                }
            }
        }
        
    }
}

let graph = Graph(count: 4)
graph.addEdge(src: 0, dest: 1)
//graph.addEdge(src: 0, dest: 2)
graph.addEdge(src: 0, dest: 2)
graph.addEdge(src: 1, dest: 2)
graph.addEdge(src: 2, dest: 0)
graph.addEdge(src: 2, dest: 3)
graph.addEdge(src: 3, dest: 3)


print("Breath First Search")
graph.bfs(source: 2)
