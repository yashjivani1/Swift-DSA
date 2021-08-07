//
//  main.swift
//  TransposeGraph
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
    
    func printGraph(){
        for (index,i) in self.graph.enumerated(){
            print("\(index)", terminator: "-->")
            for j in i{
                print("\(j)", terminator: " ")
            }
            print()
        }
    }
    
    func transposeGraph() -> Graph{
        let transposeGraph = Graph(count: self.vertexCount)
        
        for (index, i) in self.graph.enumerated(){
            for j in i{
                transposeGraph.addEdge(src: j, dest: index)
            }
        }
        
        return transposeGraph
    }
}

let graph = Graph(count: 5)
graph.addEdge(src: 0, dest: 1)
graph.addEdge(src: 0, dest: 4)
graph.addEdge(src: 0, dest: 3)
graph.addEdge(src: 2, dest: 0)
graph.addEdge(src: 3, dest: 2)
graph.addEdge(src: 4, dest: 1)
graph.addEdge(src: 4, dest: 3)

let transposeGraph = graph.transposeGraph()
transposeGraph.printGraph()
