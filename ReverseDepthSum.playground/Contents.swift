//: Playground - noun: a place where people can play

import UIKit


enum NestedInteger {
    case integer(Int)
    case intArray([Int])
}

var str = "Hello, playground"

let nested : [Any] = [2,[3,4],[5,6]]
let qwe = nested.flatMap{$0}
qwe


func reverseDepthSum (_ nums:[Any]) -> Int {
    
    var levels = [[Int]]()

    var flatNest = nums
    while flatNest.count > 0 {
        var arrayForLevel = [Int]()
        var nextLevel = [[Any]]()
        
        let _ : [String] = flatNest.map {
            if let x = $0 as? Int {
                arrayForLevel.append(x)
            } else if let x = $0 as? [Any] {
                nextLevel.append(x)
            }
            return ""
        }
        
        levels.append(arrayForLevel)
        flatNest = flatten(nextLevel)
    }
    
    var total = 0
    let totalLevels = levels.count
    for i in 0..<levels.count {
        let weight = totalLevels - i
        total += levels[i].reduce(0) { $0 + ($1 * weight) }
    }
    
    return total
}

func flatten(_ nums: [[Any]]) -> [Any] {
    var out = [Any]()

    let _ : [String] = nums.map {
        out += $0.map { $0 }
        return ""
    }
    
    return out
}

reverseDepthSum([[1,1],2,[1,1]])