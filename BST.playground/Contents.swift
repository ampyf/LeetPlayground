//: Playground - noun: a place where people can play

import UIKit

class Node {
    var value:Int
    var left : Node?
    var right : Node?
    
    init(_ value: Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }
    
    class func insert(value: Int, node:Node) -> () {
        if value < node.value {
            if let aNode = node.left {
                Node.insert(value: value, node: aNode)
            } else {
                node.left = Node(value)
            }
        } else {
            if let aNode = node.right {
                Node.insert(value: value, node: aNode)
            } else {
                node.right = Node(value)
            }
        }
    }
    
    class func inOrder(node: Node, array:[Int]) -> [Int] {
        
        var arr = array
        if let aNode = node.left {
            arr = Node.inOrder(node: aNode, array: arr)
        }
        print (node.value)
        arr.append(node.value)
        if let aNode = node.right {
            arr = Node.inOrder(node: aNode, array: arr)
        }
        return arr
    }
    
    class func nodeOrder(node: Node, k:Int) -> Int {
        var kOrder = k
        if let aNode = node.left {
            kOrder = Node.nodeOrder(node: aNode, k:kOrder)
        }
        kOrder += 1
        print (node.value, " " ,kOrder)
        if let aNode = node.right {
            kOrder = Node.nodeOrder(node: aNode, k:kOrder)
        }
        return kOrder
    }

}

func buildTreeFromArray(_ nums: [Int], tree:Node?) -> Node? {
    
    var combined = tree
    
    for num in nums {
        if let bst = combined {
            Node.insert(value: num, node: bst)
        } else {
            combined = Node(num)
        }
    }
    return combined
}

var tree : Node? = buildTreeFromArray([1,2,3,4],tree: nil)
var cArray : [Int] = Node.inOrder(node: tree!, array: [Int]())
Node.nodeOrder(node: tree!, k: 0)


