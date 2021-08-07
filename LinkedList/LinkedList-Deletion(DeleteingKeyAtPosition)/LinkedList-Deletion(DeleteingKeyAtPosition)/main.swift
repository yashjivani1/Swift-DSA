//
//  main.swift
//  LinkedList-Deletion(DeleteingKeyAtPosition)
//
//  Created by Yash Jivani on 26/06/21.
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
    
    func push(data: Int){
        let newNode = Node(data: data)
        newNode.next = self.head
        self.head = newNode
    }
    
    func deleteNode(pos: Int){
        if self.head == nil{
            print("Linked List is empty")
            return
        }
        
        var temp = self.head
        
        if pos == 0{
            self.head = temp?.next
            temp = nil
            return
        }
        
        for i in 0..<pos-1{
            temp = temp?.next
            if temp == nil{
                break
            }
        }
        
        if temp == nil || temp?.next == nil{
            print("Position is more then the length of array")
            return
        }
        
        let next = temp?.next?.next
        temp?.next = nil
        temp?.next = next
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
//Here we take position from 0
linkedList.deleteNode(pos: 2)
linkedList.printLinkedList()
