//
//  main.swift
//  GrapRepresentation
//
//  Created by Yash Jivani on 27/06/21.
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
        
        self.graph[dest].append(src)
    }
    
    func printGraph(){
        for i in 0..<graph.count{
            print("\(i)", terminator: "-> ")
            for j in 0..<graph[i].count{
                if j == graph[i].count - 1{
                    print(graph[i][j], terminator: "")
                }else{
                    print(graph[i][j], terminator: "-")
                }
            }
            print("\n")
        }
    }
}

let graph = Graph(count: 5)
graph.addEdge(src: 0, dest: 1)
graph.addEdge(src: 0, dest: 4)
graph.addEdge(src: 1, dest: 2)
graph.addEdge(src: 1, dest: 3)
graph.addEdge(src: 1, dest: 4)
graph.addEdge(src: 2, dest: 3)
graph.addEdge(src: 3, dest: 4)
graph.printGraph()
