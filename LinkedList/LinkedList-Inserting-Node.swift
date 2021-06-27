//
//  main.swift
//  LinkedList-Inserting-Node
//
//  Created by Yash Jivani on 26/06/21.
//

//import Foundation

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
    
    func insertFront(data: Int){
        let newNode = Node(data: data, next: nil)
        
        newNode.next = self.head
        
        self.head = newNode
    }
    
    func insertAfter(prevNode: Node?, data: Int){
        
        guard let prevNodeTemp = prevNode else{
            return
        }
        
        let newNode = Node(data: data)
        newNode.next = prevNodeTemp.next
        prevNode?.next = newNode
    }
    
    func append(data: Int){
        let newNode = Node(data: data)
        
        if self.head == nil{
            self.head = newNode
            return
        }
        
        var lastNode = self.head
        
        while lastNode?.next != nil {
            
            lastNode = lastNode?.next
        }
        
        lastNode?.next = newNode
        
    }
    
    func printLinkedList(){
        var temp = self.head
        while temp != nil{
            //Checking Coding to not print -> after last node
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

linkedList.append(data: 10)
linkedList.append(data: 20)
linkedList.append(data: 30)

linkedList.insertAfter(prevNode: linkedList.head?.next, data: 33)
linkedList.insertFront(data: 0)
linkedList.printLinkedList()

