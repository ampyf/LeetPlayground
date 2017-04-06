//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 
 Given a sorted array consisting of only integers where every element appears twice except for one element which appears once. Find this single element that appears only once.
 
 Example 1:
 Input: [1,1,2,3,3,4,4,8,8]
 Output: 2
 Example 2:
 Input: [3,3,7,7,10,11,11]
 Output: 10
 Note: Your solution should run in O(log n) time and O(1) space.
 
 */

func singleNonDuplicate(_ nums: [Int]) -> Int {
    if nums.count < 3 {
        return -1
    }
    
    for i in 0...nums.count - 3 {
        if i == 0 && nums[i] != nums[i+1] && nums[i+1] == nums[i+2] {
            return nums[i]
        } else if nums[i] != nums[i+1] && nums[i+1] != nums[i+2] {
            return nums[i+1]
        } else if i+2 == nums.count - 1 && nums[i] == nums[i+1] && nums[i+1] != nums[i+2] {
            return nums[i+2]
        }
    }
    
    return -1
}


singleNonDuplicate([1,1,2])