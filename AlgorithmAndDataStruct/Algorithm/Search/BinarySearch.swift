//
//  BinarySearch.swift
//  AlgorithmAndDataStruct
//
//  Created by hebi on 2019/4/27.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    func binarySearch(_ value: Element, range: Range<Int>? = nil) -> Index? {
        
        let searchRange =  range != nil ? range! : 0..<self.count
        
        guard searchRange.lowerBound < searchRange.upperBound else {
            // 非法range
            return nil
        }
        
        let midIndex = (searchRange.lowerBound + searchRange.upperBound) / 2
        
        if self[midIndex] < value {
            return binarySearch(value, range: (midIndex + 1)..<searchRange.upperBound)
        } else if self[midIndex] > value {
            return binarySearch(value, range: searchRange.lowerBound..<midIndex)
        } else {
            return midIndex
        }
        
    }
}
