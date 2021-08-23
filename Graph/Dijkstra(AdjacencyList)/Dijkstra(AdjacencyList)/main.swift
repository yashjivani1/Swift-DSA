//
//  main.swift
//  Dijkstra(AdjacencyList)
//
//  Created by Yash Jivani on 22/08/21.
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
    var graph: [[Edge]]
    
    init(count: Int) {
        self.vertexCount = count
        self.graph = [[Edge]](repeating: [Edge](), count: count)
    }
   
    func addEdge(src: Int, dest: Int, weight: Int){
        let edge = Edge(src: src, dest: dest, weight: weight)
        graph[src].append(edge)
    }
    
    
    func dijkstra(src: Int){
        var heap = MinHeap(capacity: self.vertexCount)
        var dist = [Int](repeating: Int.max, count: self.vertexCount)
        
        for i in 0..<self.vertexCount{
            heap.minHeap.append(MinHeapNode(vertex: i, dist: dist[i]))
            heap.pos[i] = i
        }
        
        heap.minHeap[src] = MinHeapNode(vertex: src, dist: dist[src])
        heap.pos[src] = src
        dist[src] = 0
        
        heap.decreseKey(v: src, dist: dist[src])
        heap.size = vertexCount
        
        while !heap.isEmpty() {
            let minHeapNode = heap.extractMin()
            let node = minHeapNode?.vertex
            print(node)
            
            
            for vertex in self.graph[node!]{
                let dest = vertex.dest
                print("Done")
                if heap.isInMinHeap(vertex: dest) && dist[node!] != Int.max && vertex.weight + dist[node!] < dist[dest]{
                    dist[dest] = dist[node!] + vertex.weight
                    heap.decreseKey(v: dest, dist: dist[dest])
                }
            }
        }
        
        print("Vert Distance From Source")
        for i in 0..<dist.count{
            print("\(i) \(dist[i])")
        }
    }
}

struct MinHeapNode{
    var vertex: Int
    var dist: Int
    
    init(vertex: Int, dist: Int) {
        self.vertex = vertex
        self.dist = dist
    }
}

struct MinHeap{
    var size: Int
    var capacity: Int
    var pos: [Int]
    var minHeap : [MinHeapNode]
    
    init(capacity: Int) {
        self.capacity = capacity
        self.size = 0
        self.minHeap = [MinHeapNode]()
        self.pos = [Int](repeating: 0, count: capacity)
    }
    
    func swapHeapNode(minHeap: inout [MinHeapNode],a: Int, b: Int){
        let temp = minHeap[a]
        minHeap[a] = minHeap[b]
        minHeap[b] = temp
    }
    
    mutating func minHeapify(idx: inout Int){
        var smallest = idx
        let left = 2 * idx + 1
        let right = 2 * idx + 2
        
        if(left < self.size && self.minHeap[left].dist < self.minHeap[smallest].dist){
            smallest = left
        }
        
        if(right < self.size && self.minHeap[right].dist < self.minHeap[smallest].dist){
            smallest = right
        }
        
        if(smallest != idx){
            let smallestNode = self.minHeap[smallest]
            let idxNode = self.minHeap[idx]
            
            self.pos[smallestNode.vertex] = idx
            self.pos[idxNode.vertex] = smallest
            
            
            self.swapHeapNode(minHeap: &self.minHeap,a: smallest, b: idx)
            self.minHeapify(idx: &smallest)
        }
        
    }
    
    func isEmpty() -> Bool{
        return self.size == 0
    }
    
    
    mutating func extractMin() -> MinHeapNode?{
        if self.isEmpty(){
            return nil
        }
        
        let root = self.minHeap[0]
        let lastNode = self.minHeap[self.size - 1]
        self.minHeap[0] = lastNode
        
        self.pos[root.vertex] = self.size - 1
        self.pos[lastNode.vertex] = 0
        
        self.size -= 1
        var idx = 0
        self.minHeapify(idx: &idx)
        
        return root
    }
    
    mutating func decreseKey(v: Int, dist: Int){
        var index = self.pos[v]
        self.minHeap[index].dist = dist
        
        
        while((index != 0) && self.minHeap[index].dist < self.minHeap[(index - 1) / 2].dist){
            self.pos[self.minHeap[index].vertex] = (index - 1) / 2
            self.pos[self.minHeap[(index - 1) / 2].vertex] = index
            
            self.swapHeapNode(minHeap: &self.minHeap, a: index, b: (index - 1) / 2)
            
            index = (index - 1) / 2
        }
    }
    
    func isInMinHeap(vertex: Int) -> Bool{
        if self.pos[vertex] < self.size{
            return true
        }
        return false
    }
    
}

let graph = Graph(count: 9)
graph.addEdge(src: 0, dest: 1, weight: 4)
graph.addEdge(src: 0, dest: 7, weight: 8)
graph.addEdge(src: 1, dest: 2, weight: 8)
graph.addEdge(src: 1, dest: 7, weight: 11)
graph.addEdge(src: 2, dest: 3, weight: 7)
graph.addEdge(src: 2, dest: 8, weight: 2)
graph.addEdge(src: 2, dest: 5, weight: 4)
graph.addEdge(src: 3, dest: 4, weight: 9)
graph.addEdge(src: 3, dest: 5, weight: 14)
graph.addEdge(src: 4, dest: 5, weight: 10)
graph.addEdge(src: 5, dest: 6, weight: 2)
graph.addEdge(src: 6, dest: 7, weight: 1)
graph.addEdge(src: 6, dest: 8, weight: 6)
graph.addEdge(src: 7, dest: 8, weight: 7)

graph.dijkstra(src: 0)
