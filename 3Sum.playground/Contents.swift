//: Playground - noun: a place where people can play

import UIKit


/*
 
 [1 2 3 0 -2]
 
 1 2 3      2 3 0
 1 2 0      2 3 -2
 1 2 -2
            3 0 -2
 1 3 0
 1 3 -2     0
 
 1 0 -2
 
 
 
 1 1 1 
 1 1 2
 1 1 3
 1 1 0
 1 1 -2
 
 1 2 1
 1 2 2
 1 2 3
 1 2 0
 1 2 -2
 
 1 3 1
 1 3 2
 1 3 3
 1 3 0
 1 3 -2
 
 1 0 1
 1 0 2
 1 0 3
 1 0 0
 1 0 -2

 
 
 
 
 */

func isFound(_ x:[Int], in arr : [[Int]]) -> Bool {
//    for (_,obj) in arr.enumerated() {
//        if obj == x {
//            return true
//        }
//    }
//    return false
    return arr.contains(where: {x == $0})
}

func twoSum( _ nums:[Int], excludeIndex:Int, targetSum: Int) -> [[Int]] {
    // returns array of 2 Ints that will sum up to targetSum
    var compDict = [Int:Int]() // targetSum-value, idx of value
    var otherTwo = [[Int]]()
    for i in 0..<nums.count {
        if i != excludeIndex {
            if let compIdx = compDict[nums[i]] {
                otherTwo.append([nums[i],nums[compIdx]])
            } else {
                let complement = targetSum - nums[i]
                compDict[complement] = i
            }
        }
    }
    return otherTwo
}



func threeSum(_ nums: [Int]) -> [[Int]] {
    
    var sums = [[Int]]()
    
    // Loop though nums: i..<nums.count
    for i in 0..<nums.count {
        let target = 0 - nums[i]
        
        let _ = twoSum(nums, excludeIndex: i, targetSum: target).map{
            return [nums[i]] + $0
        }.map {
            return $0.sorted()
            }.filter { return !isFound($0, in: sums)
            }.map {
                sums.append($0)
        }
    }
    
    return sums
}

threeSum([0,0,0,0])

//threeSum([-4,-2,-2,-2,0,1,2,2,2,3,3,4,4,6,6])
//threeSum([0,-1,1,3,-5,2])
//threeSum([9])

//threeSum([-13,11,11,0,-5,-14,12,-11,-11,-14,-3,0,-3,12,-1,-9,-5,-13,9,-7,-2,9,-1,4,-6,-13,-7,10,10,9,7,13,5,4,-2,7,5,-13,11,10,-12,-14,-5,-8,13,2,-2,-14,4,-8,-6,-13,9,8,6,10,2,6,5,-10,0,-11,-12,12,8,-7,-4,-9,-13,-7,8,12,-14,10,-10,14,-3,3,-15,-14,3,-14,10,-11,1,1,14,-11,14,4,-6,-1,0,-11,-12,-14,-11,0,14,-9,0,7,-12,1,-6])
