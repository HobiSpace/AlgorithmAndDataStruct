//
//  HashTable.swift
//  AlgorithmAndDataStruct
//
//  Created by hebi on 2019/5/10.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation

class HashTable<Key: Hashable, Value> {
    
    typealias Element = (key: Key, value: Value)
    typealias Bucket = [Element]
    var buckets: [Bucket] = [Bucket].init(repeating: [Element].init(), count: 100)
    
    func index(for key: Key) -> Int {
        return abs(key.hashValue) % buckets.count
    }
    
    func update(for key: Key, value: Value?) {
        if let newValue = value {
            let idx = index(for: key)
            for (eidx, element) in buckets[idx].enumerated() {
                if element.key == key {
                    buckets[idx][eidx].value = newValue
                    return
                }
            }
            buckets[idx].append((key, newValue))
        } else {
            let idx = index(for: key)
            for (eidx, element) in buckets[idx].enumerated() {
                if element.key == key {
                    buckets[idx].remove(at: eidx)
                    // 如果不return 就不能这么搞
                    return
//                    return
                }
            }
        }
    }
    
    func remove(for key: Key) {
        update(for: key, value: nil)
    }
    
    func object(for key: Key) -> Value? {
        let idx = index(for: key)
        for element in buckets[idx] {
            if element.key == key {
                return element.value
            }
        }
        return nil
    }
}
