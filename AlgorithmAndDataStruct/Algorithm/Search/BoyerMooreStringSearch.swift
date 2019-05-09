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
        
        for (i, c) in pattern.enumerated() {
            guard skipTable[c] == nil else {
                continue
            }
            skipTable[c] = i
        }
        
        // 匹配
        var i = index(startIndex, offsetBy: pattern.count - 1)
        
        while i < endIndex {
            var j = i
            var p = index(before: pattern.endIndex)
            var match = true
            while j >= self.startIndex, p >= pattern.startIndex {
                let pc = pattern[p]
                let sc = self[j]
                print("compare self: \(sc) pattern: \(pc) ")
                guard pc == sc else {
                    match = false
                    break
                }
                // 有可能crash
                if j > self.startIndex, p > pattern.startIndex {
                    j = index(before: j)
                    p = index(before: p)
                } else {
                    // 比对完成了
                    break
                }
            }
            if match {
                // 找到了
                return j
            } else {
                // 跳表
                var skipIdx = skipTable[self[j]]
                if skipIdx == nil {
                    skipIdx = -1
                }
                if let patternIdx = skipTable[pattern[p]] {
                    var jump = patternIdx - skipIdx!
                    if jump <= 0 {
                        // 不可以向前跳
                        jump = 1
                    }
                    i = index(j, offsetBy: jump)
                } else {
                    // 不可能
                }
            }
        }
        return nil
    }
}
