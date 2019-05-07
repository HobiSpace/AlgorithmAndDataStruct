//
//  BoyerMooreStringSearch.swift
//  AlgorithmAndDataStruct
//
//  Created by hebi on 2019/4/27.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation

extension String {
    
    func forceIndex(of pattern: String) -> Index? {
        for i in indices {
            var j = i
            var find = true
            for p in pattern.indices {
                guard j != endIndex, pattern[p] == self[j] else {
                    find = false
                    break
                }
                j = index(after: j)
            }
            if find {
                return i
            }
        }
        return nil
    }
    
    func bmIndex(of pattern: String) -> Index? {
        
        // 合法判断
        guard pattern.count <= self.count else {
            return nil
        }
        
        // 构造跳表
        var skipTable: [Character : Int] = [:]
        
        for (i, c) in pattern.reversed().enumerated() {
            guard skipTable[c] == nil else {
                continue
            }
            skipTable[c] = i
        }
        
        // 匹配
        let i = index(startIndex, offsetBy: pattern.count - 1)
        
        while i < endIndex {
            var j = i
            var p = index(before: pattern.endIndex)
            var match = true
            while j >= self.startIndex, p >= pattern.startIndex {
                let pc = pattern[p]
                let sc = self[j]
                guard pc == sc else {
                    match = false
                    break
                }
                // 有可能crash
                j = index(before: j)
                p = index(before: p)
            }
            if match {
                // 找到了
                return j
            } else {
                // 跳表
                let skipIdx = skipTable[self[j]]
                if let skipIdx = skipIdx {
                    j = index(j, offsetBy: skipIdx)
                } else {
                    j = index(j, offsetBy: pattern.count)
                }
            }
        }
        return nil
    }
}
