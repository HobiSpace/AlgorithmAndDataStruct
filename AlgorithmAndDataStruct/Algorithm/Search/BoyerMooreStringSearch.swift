//
//  BoyerMooreStringSearch.swift
//  AlgorithmAndDataStruct
//
//  Created by hebi on 2019/4/27.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation

extension String {
    func bmIndex(of pattern: String) -> Index? {
        let patternLength = pattern.count

        guard patternLength > 0, patternLength < self.count else {
            return nil
        }

        var skipTable = [Character : Int]()

        for (i, c) in pattern.enumerated() {
            skipTable[c] = patternLength - i - 1
        }
        
        let p = pattern.index(before: pattern.endIndex)

        return nil
        
        
//        let patternLength = pattern.count
//        guard patternLength > 0, patternLength <= self.count else { return nil }
//
//        var skipTable = [Character: Int]()
//        for (i, c) in pattern.enumerated() {
//            skipTable[c] = patternLength - i - 1
//        }
//
//        let p = pattern.index(before: pattern.endIndex)
//        let lastChar = pattern[p]
//
//        var i = index(startIndex, offsetBy: patternLength - 1)
//
//        func backwards() -> Index? {
//            var q = p
//            var j = i
//            while q > pattern.startIndex {
//                j = index(before: j)
//                q = index(before: q)
//                if self[j] != pattern[q] { return nil }
//            }
//            return j
//        }
//
//        while i < endIndex {
//            let c = self[i]
//
//            if c == lastChar {
//
//                if let k = backwards() { return k }
//
//                i = index(after: i)
//            } else {
//                i = index(i, offsetBy: skipTable[c] ?? patternLength, limitedBy: endIndex) ?? endIndex
//            }
//        }
//        return nil
    }
}
