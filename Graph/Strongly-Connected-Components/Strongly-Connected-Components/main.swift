//
//  main.swift
//  Strongly-Connected-Components
//
//  Created by Yash Jivani on 06/08/21.
//

import Foundation

class Graph{
    var vertexCount: Int
    var graph: [[Int]]
    
    init(count: Int) {
        self.vertexCount = count
        self.graph = [[Int]](repeating: [Int](), count: self.vertexCount)
    }
    
    func addEdge(src: Int, dest: Int){
        self.graph[src].append(dest)
    }
    
    func getTranspose() -> Graph{
        let transposeGraph = Graph(count: self.vertexCount)
        
        for (index, elements) in self.graph.enumerated(){
            for element in elements{
                transposeGraph.graph[element].append(index)
            }
        }
        
        return transposeGraph
    }
    
    func dfsUtil(vertex: Int, visited: inout [Bool]){
        visited[vertex] = true
        print("\(vertex) ", terminator: "")
        
        for i in self.graph[vertex]{
            if !visited[i]{
                dfsUtil(vertex: i, visited: &visited)
            }
        }
    }
    
    func dfs(vertex: Int, visited: inout [Bool], stack: inout [Int]){
        visited[vertex] = true
        
        for i in self.graph[vertex]{
            if !visited[i]{
                dfs(vertex: i, visited: &visited, stack: &stack)
            }
        }
        stack.append(vertex)
    }
    
    func printSCC(){
        var stack = [Int]()
        
        var visited = [Bool](repeating: false, count: self.vertexCount)
        
        for (index, _) in self.graph.enumerated(){
            if !visited[index]{
                self.dfs(vertex: index, visited: &visited, stack: &stack)
            }
        }
        
        let transposeGraph = self.getTranspose()
        
        for i in 0..<self.vertexCount{
            visited[i] = false
        }
        
        while !stack.isEmpty{
            let vertex = stack[stack.count - 1]
            stack.remove(at: stack.count-1)
            
            if !visited[vertex]{
                transposeGraph.dfsUtil(vertex: vertex, visited: &visited)
                print()
            }
        }
    }
}

let graph = Graph(count: 5)
graph.addEdge(src: 1, dest: 0)
graph.addEdge(src: 0, dest: 2)
graph.addEdge(src: 2, dest: 1)
graph.addEdge(src: 0, dest: 3)
graph.addEdge(src: 3, dest: 4)

print("Strongly connected Components in the given graph are.")
graph.printSCC()
