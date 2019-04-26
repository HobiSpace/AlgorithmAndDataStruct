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
