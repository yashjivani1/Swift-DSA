//
//  main.swift
//  ReverseLinkedList
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
    
    func reverseRecursive(node: inout Node?) -> Node?{
        if node == nil || node?.next == nil{
            return node
        }
        
        let reverseList = self.reverseRecursive(node: &node!.next)
        
        node?.next?.next = node
        node?.next = nil
        
        return reverseList
    }
    
    func reverseIterative(){
        var prev : Node? = nil
        var curr = self.head
        while curr != nil{
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        
        self.head = prev
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
linkedList.printLinkedList()
linkedList.head = linkedList.reverseRecursive(node: &linkedList.head)
linkedList.printLinkedList()
linkedList.reverseIterative()
linkedList.printLinkedList()


