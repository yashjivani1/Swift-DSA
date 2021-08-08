//
//  main.swift
//  Prims-Algorithm(MST)
//
//  Created by Yash Jivani on 08/08/21.
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

class Graph{
    let vertexCount: Int
    var graph: [[Int]]
    
    
    init(count: Int, adjMatrix: [[Int]]) {
        self.vertexCount = count
        self.graph = adjMatrix
    }
    
    
    
    func getMinVertex(key: inout [Int], visited: inout [Bool]) -> Int{
        var min = Int.max
        var minIndex: Int = -1
        
        for i in 0..<self.vertexCount{
            if !visited[i] && key[i] < min{
                min = key[i]
                minIndex = i
            }
        }
        return minIndex
    }
    
    func primMST(){
        var parents = [Int](repeating: -1, count: self.vertexCount)
        
        var key = [Int](repeating: Int.max, count: self.vertexCount)
        
        var visited = [Bool](repeating: false, count: self.vertexCount)
        
        key[0] = 0
        
        
        
        for _ in 0..<self.vertexCount - 1{
            let minVertex = self.getMinVertex(key: &key, visited: &visited)
            
            visited[minVertex] = true
            
            for j in 0..<self.vertexCount{
                if self.graph[minVertex][j] != 0 && !visited[j] && self.graph[minVertex][j] < key[j]{
                    
                    if j > parents.count - 1{
                        parents.append(j)
                    } else{
                        parents[j] = minVertex
                    }
                    
                    key[j] = graph[minVertex][j]
                }
            }
        }
        self.printMST(parent: parents)
        
    }
    
    func printMST(parent: [Int]){
        for i in 1..<self.vertexCount{
            print("\(parent[i]) - \(i) -> \(self.graph[i][parent[i]])")
        }
    }
}

let matrix = [[0, 2, 0, 6, 0],
              [2, 0, 3, 8, 5],
              [0, 3, 0, 0, 7],
              [6, 8, 0, 0, 9],
              [0, 5, 7, 9, 0]]
let graph = Graph(count: 5, adjMatrix: matrix)


graph.primMST()
