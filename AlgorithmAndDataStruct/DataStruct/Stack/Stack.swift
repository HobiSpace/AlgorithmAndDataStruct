//
//  Stack.swift
//  AlgorithmAndDataStruct
//
//  Created by hebi on 2019/4/17.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation

class Stack<T> {
    
    fileprivate var values: [T] = []
    
    init() {
        
    }
    
    func isEmpty() -> Bool {
        return values.isEmpty
    }
    
    func push(_ value: T) {
        values.append(value)
    }
    
    func pop() -> T? {
        return values.popLast()
    }
    
    func top() -> T? {
        return values.last
    }
}
