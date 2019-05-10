//
//  main.swift
//  AlgorithmAndDataStruct
//
//  Created by hebi on 2019/4/17.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation

print("Hello, World!")

let list = LinkedList<Int>.init()
list.append(value: 1)
list.append(value: 2)
list.append(value: 3)

var node = list.head
print("顺序")
while node != nil {
    print(node?.value)
    node = node?.next
}
print("逆序")
node = list.tail
while node != nil {
    print(node?.value)
    node = node?.previous
}

// 反转
list.reverse()

node = list.head
print("顺序")
while node != nil {
    print(node?.value)
    node = node?.next
}

print("逆序")
node = list.tail
while node != nil {
    print(node?.value)
    node = node?.previous
}


var array = [1, 3, 0, -1, 5, 5,  10, 6, 2, -10]
//array.insertSort { (i, j) -> Bool in
//    return i <= j
//}

let tmp = array.mergeSort { (i, j) -> Bool in
    return i <= j
}
let idx = tmp.binarySearch(0)
print(tmp)



let text = "Hello, World"
let index = text.bmIndex(of: "World")

let table = HashTable<String, String>.init()
table.update(for: "key1", value: "value1")
table.update(for: "key2", value: "value2")
table.update(for: "key3", value: "value3")

table.remove(for: "key2")


var array1 = [1,2,3,4,5,6,7,8]
for (idx, i) in array1.enumerated() {
    if i == 3 {
        array1.remove(at: idx)
    }
    
    if i == 6 {
        array1.remove(at: idx)
    }
}

print(array1)
