//
//  main.swift
//  LinkedList-Deletion(DeletingGivenKey)
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
    
    func deleteNode(data: Int){
        var temp = self.head
        
        if temp != nil{
            if temp?.data == data{
                self.head = temp?.next
                temp = nil
                return
            }
        }
        var prev = temp
        while temp != nil {
            if temp?.data == data{
                break
            }
            print("Done")
            prev = temp
            temp = temp?.next
        }
        
        if temp == nil{
            return
        }
        
        prev?.next = temp?.next
        temp = nil
    }
    
    func printLinkedList(){
        var temp = self.head
        while temp != nil{
            if temp?.next == nil{
                print(temp!.data, terminator: "\n")
            }else{
                print(temp!.data, terminator: "->")
            }
            temp = temp?.next
        }
    }
}


let linkedList = LinkedList()

linkedList.push(data: 10)
linkedList.push(data: 20)
linkedList.push(data: 30)
linkedList.deleteNode(data: 20)
linkedList.printLinkedList()
