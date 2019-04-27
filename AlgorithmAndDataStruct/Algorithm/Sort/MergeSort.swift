//
//  MergeSort.swift
//  AlgorithmAndDataStruct
//
//  Created by hebi on 2019/4/27.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation

extension Array {
    
    private func merge(left: Array, right: Array, compare: (Element, Element) -> Bool) -> Array {
        
        print("merge left: \(left), right: \(right)")
        
        var leftIdx = 0
        var rightIdx = 0
        
        var orderArray = [Element]()
        
        while leftIdx < left.count && rightIdx < right.count {
            if compare(left[leftIdx], right[rightIdx]) {
                orderArray.append(left[leftIdx])
                leftIdx = leftIdx + 1
            } else {
                orderArray.append(right[rightIdx])
                rightIdx = rightIdx + 1
            }
        }
        
        while leftIdx < left.count {
            orderArray.append(left[leftIdx])
            leftIdx = leftIdx + 1
        }
        
        while rightIdx < right.count {
            orderArray.append(right[rightIdx])
            rightIdx = rightIdx + 1
        }
        
        return orderArray
    }
    
    func mergeSort(compare: (Element, Element) -> Bool) -> Array {
        guard self.count > 1 else {
            return self
        }
        
        let midIndex = self.count / 2
        let leftArray = Array(self[0..<midIndex]).mergeSort(compare: compare)
        let rightArray = Array(self[midIndex..<self.count]).mergeSort(compare: compare)
        return merge(left: leftArray, right: rightArray, compare: compare)
    }
    
}
