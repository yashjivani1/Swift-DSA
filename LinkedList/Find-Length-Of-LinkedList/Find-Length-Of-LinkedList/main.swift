//
//  main.swift
//  Find-Length-Of-LinkedList
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
    func push(data: Int){
        let newNode = Node(data: data)
        newNode.next = self.head
        self.head = newNode
    }
    
    func getCountIterative() -> Int{
        var temp = self.head
        var count = 0
        
        while temp != nil{
            count += 1
            temp = temp?.next
        }
        return count
    }
    
    func getCountRecursive(node: inout Node?) -> Int{
        guard let temp = node else{
            return 0
        }
        
        return 1 + self.getCountRecursive(node: &temp.next)
    }
}

let linkedList = LinkedList()

linkedList.push(data: 10)

linkedList.push(data: 20)


linkedList.push(data: 30)


linkedList.push(data: 40)
print(linkedList.getCountIterative())
print(linkedList.getCountRecursive(node: &linkedList.head))
