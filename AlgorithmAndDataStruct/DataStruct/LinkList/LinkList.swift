//
//  LinkList.swift
//  AlgorithmAndDataStruct
//
//  Created by hebi on 2019/4/25.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation

class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    weak var previous: LinkedListNode?
    
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    
    typealias Node = LinkedListNode<T>
    
    var head: Node?
    
    var tail: Node?
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func append(value: T) {
        let node = Node.init(value: value)
        
        if let tail = self.tail {
            tail.next = node
            node.previous = tail
            self.tail = node
        } else {
            head = node
            tail = node
        }
    }
    
    func node(at index: Int) -> Node {
        if index == 0 {
            return head!
        } else {
            var node = head!.next
            for _ in 1..<index {
                node = node?.next
                if node == nil {
                    break
                }
            }
            return node!
        }
    }
    
    func insert(value: T, at index: Int) {
        let newNode = Node.init(value: value)
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else {
            let prev = node(at: index - 1)
            // 这里如果直接取node at index 会崩溃，兼容性差
            let next = prev.next
            newNode.previous = prev
            prev.next = newNode
            newNode.next = next
            next?.previous = newNode
        }
    }
    
    func removeAll() {
        head = nil
    }
    
    func remove(node: Node) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
            next?.previous = prev
        } else {
            head = next
            next?.previous = prev
        }
        node.previous = nil
        node.next = nil
        return node.value
    }
    
    func reverse() {
        
//        var node = head
//        tail = node           // If you had a tail pointer
//        while let currentNode = node {
//            node = currentNode.next
//            swap(&currentNode.next, &currentNode.previous)
//            head = currentNode
//        }
        
        var node = head
        tail = node
        while node != nil {
            let next = node?.next
            node?.next = node?.previous
            node?.previous = next
            if next == nil {
                head = node
            }
            node = next
        }
    }
}
