//
//  main.swift
//  Swap-nodes-without-swapping-data
//
//  Created by Yash Jivani on 27/06/21.
//

import Foundation

class Node{
    var data: Int
    var next: Node?
    
    init(data: Int, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkedList{
    var head: Node?
    
    func swapNode(dataX: Int, dataY: Int){
        
        if dataX == dataY{
            return
        }
        
        var prevX : Node? = nil
        var currX = self.head
        while currX != nil && currX?.data != dataX{
            prevX = currX
            currX = currX?.next
        }
        
        var prevY : Node? = nil
        var currY = self.head
        while currY != nil && currY?.data != dataY {
            prevY = currY
            currY = currY?.next
        }
        
        
        if prevX != nil{
            prevX?.next = currY
        }else{
            self.head = currY
        }
        
        if prevY != nil{
            prevY?.next = currX
        }else{
            self.head = currX
        }
        
        let temp = currX?.next
        currX?.next = currY?.next
        currY?.next = temp
    }
    
    func swapNodeOptimized(dataX: Int, dataY: Int){
        var headTemp = self.head
        
        if dataX == dataY{
            return
        }
        
        var nodeX : Node? = nil
        var nodeY : Node? = nil
        
        while headTemp?.next != nil{
            if headTemp?.next?.data == dataX{
                nodeX = headTemp
            }else if headTemp!.next?.data == dataY{
                nodeY = headTemp
            }
            
            headTemp = headTemp?.next
        }
        
        if nodeX != nil && nodeY != nil{
            var temp = nodeX?.next
            nodeX?.next = nodeY?.next
            nodeY?.next = temp
            
            temp = nodeX?.next?.next
            nodeX?.next?.next = nodeY?.next?.next
            nodeY?.next?.next = temp
        }
    }
    
    func push(data: Int){
        let newNode = Node(data: data)
        newNode.next = self.head
        self.head = newNode
    }
    
    func printLinkedList(){
        var temp = self.head
        while temp != nil{
            if temp?.next != nil{
                print(temp!.data, terminator: "->")
            }else{
                print(temp!.data)
            }
            temp = temp?.next
        }
    }
}

let linkedList = LinkedList()

linkedList.push(data: 10)

linkedList.push(data: 20)

linkedList.push(data: 30)

linkedList.push(data: 40)

linkedList.push(data: 50)
linkedList.printLinkedList()
linkedList.swapNode(dataX: 20, dataY: 40)
linkedList.printLinkedList()
linkedList.swapNodeOptimized(dataX: 10, dataY: 40)
linkedList.printLinkedList()
