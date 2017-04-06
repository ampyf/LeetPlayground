//: Playground - noun: a place where people can play

import UIKit

/*
 
 Given a collection of distinct numbers, return all possible permutations.
 
 For example,
 [1,2,3] have the following permutations:
 [
 [1,2,3],
 [1,3,2],
 [2,1,3],
 [2,3,1],
 [3,1,2],
 [3,2,1]
 ]
 
 */


func permutations (_ nums : [Int]) -> [Int] {
    if nums.count == 1 {
        return [nums.first!]
    }
    
    

}

func permute(_ nums: [Int]) -> [[Int]] {

}


permute([1,2,3])
