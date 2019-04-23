//
//  Queue.swift
//  AlgorithmAndDataStruct
//
//  Created by hebi on 2019/4/18.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation

class Queue<T> {
    
    fileprivate var values: [T] = []
    
    func enqueue(_ newValue: T) {
        values.append(newValue)
    }
    
    func dequeue() -> T? {
        if !isEmpty() {
            return values.removeFirst()
        } else {
            return nil
        }
    }
    
    func isEmpty() -> Bool {
        return values.isEmpty
    }
    
    func front() -> T? {
        return values.first
    }
}
