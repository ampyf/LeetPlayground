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
    
    class func valueAtK(node: Node, targetK:Int, k:Int, v:Int?) -> (idx:Int, valueAtIdx:Int?) {
        var value : Int?

        if let v2 = v {
            value = v2
        } else {
            value = 999
        }
        
        var kOrder = k
        
        if kOrder + 1 == targetK && v != nil {
            print ("value is ", node.value, " at " ,kOrder)
            return (kOrder,value)
        }

        print ("Coming in k:",kOrder," v: ", value)
        if let aNode = node.left {
            kOrder = Node.valueAtK(node: aNode, targetK:targetK, k:kOrder, v:value).idx
        }
        kOrder += 1
        if kOrder == targetK {
            print ("value is ", node.value, " at " ,kOrder)
            value = node.value
        }

        if let aNode = node.right {
            kOrder = Node.valueAtK(node: aNode, targetK:targetK, k:kOrder, v:value).idx
        }
        return (kOrder, value)
    }
}

func combineArray(_ nums: [Int], tree:Node?) -> Node? {
    
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


func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    
    var combined : Node? = nil
    var retVal : Double = 0
    
    combined = combineArray(nums1, tree: combined)
    combined = combineArray(nums2, tree: combined)
    if let c = combined {
//        Node.inOrder(node: c)
        let z = Node.valueAtK(node: c, targetK: 1, k: -1, v: nil)
        print (z.idx, "g", z.valueAtIdx)
/*
        let count = nums1.count + nums2.count
        if count % 2 == 0 {
            let i = count/2
            print (i)
            if let x = Node.valueAtK(node: c, targetK: i, k: -1, v: nil).valueAtIdx,
            let y = Node.valueAtK(node: c, targetK: i-1, k: -1, v:nil).valueAtIdx {
                retVal = Double(x+y)/2
            }
        } else {
            let i = Int(ceil(Double(count/2)))
            retVal = Double(Node.valueAtK(node: c, targetK: i, k: -1, v: nil).valueAtIdx!)
        }
 */
    }
    
    
    return retVal
}


findMedianSortedArrays([1,2],[3,4])


///////////////////////////
/*
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var combined = [Int]()
    
    let count1 = nums1.count
    let count2 = nums2.count

    var i1 = 0, i2 = 0
    var done1 = !(nums1.count > 0), done2 = !(nums2.count > 0)
    
    while !(done1 && done2) {
        
        if done1 && !done2 {
            combined.append(contentsOf: nums2.suffix(from: i2))
            done2 = true
        } else if done2 && !done1 {
            combined.append(contentsOf: nums1.suffix(from: i1))
            done1 = true
        } else {
            if nums1[i1] < nums2[i2] {
                combined.append(nums1[i1])
                i1 += 1
                if i1 == count1 {
                    done1 = true
                }
            } else if nums1[i1] > nums2[i2] {
                combined.append(nums2[i2])
                i2 += 1
                if i2 == count2 {
                    done2 = true
                }
            } else {    // Equal, take both
                combined.append(nums1[i1])
                i1 += 1
                if i1 == count1 {
                    done1 = true
                }

                combined.append(nums2[i2])
                i2 += 1
                if i2 == count2 {
                    done2 = true
                }
            }
        }
    }
    
    print(combined)
    let count = combined.count
    if count % 2 == 0 {
        let i = count/2
        let x = combined[i]
        let y = combined[i-1]
        return (Double(x+y)/2)
    } else {
        let i = Int(ceil(Double(count/2)))
        return Double(combined[i])
    }
    
}

findMedianSortedArrays([1,3],[2])
findMedianSortedArrays([1,2],[3,4])
 */
