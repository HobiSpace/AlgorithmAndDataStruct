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
        let node = LinkedListNode<T>.init(value: value)
        
        if let tail = self.tail {
            tail.next = node
            node.previous = tail
            self.tail = node
        } else {
            head = node
            tail = node
        }
    }
    
}
