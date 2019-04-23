//
//  BinarySearchTree.swift
//  AlgorithmAndDataStruct
//
//  Created by hebi on 2019/4/18.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation

class BinarySearchTree<T: Comparable> {
    
    var value: T
    var parent: BinarySearchTree<T>?
    var left: BinarySearchTree<T>?
    var right: BinarySearchTree<T>?
    
    init(value: T) {
        self.value = value
    }
    
    func isRoot() -> Bool {
        return parent == nil
    }
    
    func isLeaf() -> Bool {
        return !hasAnyChild()
    }
    
    func isLeftChild() -> Bool {
        return parent?.left === self
    }
    
    func isRightChild() -> Bool {
        return parent?.right === self
    }
    
    func hasLeftChild() -> Bool {
        return left != nil
    }
    
    func hasRightChild() -> Bool {
        return right != nil
    }
    
    func hasAnyChild() -> Bool {
        return hasLeftChild() || hasRightChild()
    }
    
    func hasBothChildren() -> Bool {
        return hasLeftChild() && hasRightChild()
    }
    
    func count() -> Int {
        return (left?.count() ?? 0) + 1 + (right?.count() ?? 0)
    }
    
    convenience init(array: [T]) {
        
        precondition(array.count > 0)
        
        self.init(value: array.first!)
        
        for value in array.dropFirst() {
            insert(value: value)
        }
    }
}

// MARK: - 插入
extension BinarySearchTree {
    func insert(value: T) {
        if value < self.value {
            if let left = self.left {
                left.insert(value: value)
            } else {
                let tmpLeft = BinarySearchTree<T>.init(value: value)
                self.left = tmpLeft
                self.left?.parent = self
            }
        } else {
            if let right = self.right {
                right.insert(value: value)
            } else {
                let tmpRight = BinarySearchTree<T>.init(value: value)
                self.right = tmpRight
                self.right?.parent = self
            }
        }
    }
}

// MARK: - 搜索
extension BinarySearchTree {
    func search(value: T) -> BinarySearchTree? {
        if value < self.value {
            return self.left?.search(value: value)
        } else if value > self.value {
            return self.right?.search(value: value)
        } else {
            return self
        }
    }
}

// MARK: - 遍历
extension BinarySearchTree {
    func traverseInOrder(process: (T) -> Void) {
        left?.traverseInOrder(process: process)
        process(value)
        right?.traverseInOrder(process: process)
    }
    
    func traversePreOrder(process: (T) -> Void) {
        process(value)
        left?.traversePreOrder(process: process)
        right?.traversePreOrder(process: process)
    }
    
    func traversePostOrder(process: (T) -> Void) {
        left?.traversePostOrder(process: process)
        right?.traversePostOrder(process: process)
        process(value)
    }
}
