//: Playground - noun: a place where people can play

import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    
    class func list(array: [Int]) -> ListNode? {
        var listNode : ListNode?
        var last : ListNode?
        for (_,val) in array.enumerated() {
            let node = ListNode(val)
            if let lastNode = last {
                lastNode.next = node
            } else {
                listNode = node
            }
            last = node
        }
        return (listNode)
    }
    
    func description() -> String {
        var ptr : ListNode? = self
        var str = ""
        while ptr != nil {
            str = "\(str) \(ptr?.val)"
            ptr = ptr?.next
        }
        return str
    }
}


func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var sum : Int = 0
    var sumList : ListNode?
    var sPtr : ListNode?
    var ptrL1 : ListNode? = l1, ptrL2 : ListNode? = l2
    while ptrL1 != nil || ptrL2 != nil {
        if let l = ptrL1 {
            sum += l.val
            ptrL1 = l.next
        }
        if let l = ptrL2 {
            sum += l.val
            ptrL2 = l.next
        }
        var store = sum
        if sum >= 10 {
            store = sum - 10
            sum = 1
        } else {
            sum = 0
        }
        let sNode = ListNode(store)
        if let s = sPtr {
            s.next = sNode
            sPtr = sNode
        } else {
            sPtr = sNode
            sumList = sNode
        }
    }
    if sum != 0 {
        let sNode = ListNode(sum)
        sPtr?.next = sNode
    }
    return sumList
}

print(addTwoNumbers(ListNode.list(array: [2,4,3]), ListNode.list(array:[5,6,4]))!.description())
print(addTwoNumbers(ListNode.list(array: [5]), ListNode.list(array: [5]))!.description())
