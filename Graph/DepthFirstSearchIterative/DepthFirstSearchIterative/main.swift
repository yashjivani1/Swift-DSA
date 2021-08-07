//
//  DepthFirstIterative.swift
//  DFS
//
//  Created by Yash Jivani on 29/05/21.
//

import Foundation
class Graph{
    var vertexCount : Int
    var graph: [[Int]]
    
    init(count: Int) {
        self.vertexCount = count
        self.graph = [[Int]](repeating: [Int](), count: count)
    }
    
    
    func addEdge(src: Int, dest: Int){
        
        
        self.graph[src].append(dest)
        
        //self.graph[dest].append(src)
    }
    
    
    func dfsUtility(source: Int, visited: inout [Bool]){
        //var visited : [Bool] = [Bool](repeating: false, count: self.vertexCount)
        visited[source] = true
       
        
        var stack = [Int]()
        stack.append(source)
        print("\(source) ", terminator: "")
        while !stack.isEmpty{
            let node = stack[stack.count-1]
            stack.remove(at: stack.count - 1)
            
            if (!visited[node]){
                print("\(node) ", terminator: "")
                visited[node] = true
            }
            
            
            for neighbour in self.graph[node]{
                if !visited[neighbour]{
                    stack.append(neighbour)
                }
            }
            
            
        }
        
    }
    
    func dfs(){
        var visited : [Bool] = [Bool](repeating: false, count: self.vertexCount)
        
        for i in 0..<self.vertexCount{
            if !visited[i]{
                self.dfsUtility(source: i, visited: &visited)
            }
        }
    }

}

let graph = Graph(count: 5)
graph.addEdge(src: 1, dest: 0)
//graph.addEdge(src: 0, dest: 2)
graph.addEdge(src: 2, dest: 1)
graph.addEdge(src: 3, dest: 4)
graph.addEdge(src: 4, dest: 0)

print("Depth First Search")
graph.dfs()
