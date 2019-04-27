//
//  InsertSort.swift
//  AlgorithmAndDataStruct
//
//  Created by hebi on 2019/4/27.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation

extension Array {
    
    /// 插入排序
    ///
    /// - Parameter compare: true: e1, e2   false: e2, e1
    mutating func insertSort(compare: (Element, Element) -> Bool) {
        for i in 1..<count {
            var j = i
            while j > 0, !compare(self[j-1], self[j]) {
                swapAt(j-1, j)
                j = j - 1
            }
        }
    }
}
