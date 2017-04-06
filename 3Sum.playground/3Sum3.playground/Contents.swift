//: Playground - noun: a place where people can play

import UIKit

/*
 [1,0,-1,2]
 
 1  :   [-1 :   2]
 -1 :   [1  :   0]

 
 */

extension Array : Hashable, Equatable {
    public var hashValue : Int {
        return self.sorted(by: Self.Iterator.Element).map { return String($0)}.joined(separator: " ").hashValue
    }
}

public func ==<T>(lhs: [T], rhs: [T]) -> Bool {
    return lhs.hashValue == rhs.hashValue
}


// out: [Int: [[Int:Int]] ] where key = sum, value = array of dictionary, each dictionary is int : idx, the two inner dictionary keys sum up to key
func generateTwoSumMap(_ nums:[Int]) -> [Int: [TwoComp] ] {
    var out = [Int: [TwoComp]]()
    for i in 0..<nums.count {
        for j in 0..<nums.count {
            if i != j {
                let key = nums[i] + nums[j]
                if var arrForKey = out[key] {
//                    print ("ke= ",key,"afk ",arrForKey, " i= ",i," j= ",j)
                    var found = false
                    for idx in 0..<arrForKey.count {
                        let tc = arrForKey[idx]
                        if ([tc.x, tc.y].contains(nums[i]) && [tc.x, tc.y].contains(nums[j])) {
                            found = true
                            break
                        }
                    }
                    if !found {
//                        print("i=",i," j=",j)
                        arrForKey.append(TwoComp(fromArray: nums, xIdx: i, yIdx: j))
                        out[key] = arrForKey
                    }

                } else {
                    out[key] = [TwoComp(fromArray: nums, xIdx: i, yIdx: j)]
                }
            }
        }
    }
    return (out)
}


func threeSum(_ nums: [Int]) -> [[Int]] {
    
    guard nums.count >= 3 else {
        return []
    }
    
    let twoSumMap = generateTwoSumMap(nums)
//    print(twoSumMap)
    
    var sums = Set<String>()

    // Loop though nums: i..<nums.count
    for i in 0..<nums.count {
        let target = 0 - nums[i]
        if let complement = twoSumMap[target] {
            for compIdx in 0..<complement.count {
                let tc = complement[compIdx]
//                print ("numsi ", nums[i]," i ",i," tc ",tc)
                if ![tc.xIdx, tc.yIdx].contains(i) {
                    let intArray = [tc.x, tc.y] + [nums[i]]
                    let str = intArray.sorted().map { return String($0)}.joined(separator: " ")
                    sums.insert(str)
                }
            }
        }
    }
    
    let outSums = sums.map { $0.components(separatedBy: " ").map {Int($0)!} }
    return outSums
}

//threeSum([0,0,0])
//threeSum([1,2,-2,-1])
threeSum([-4,-2,-2,-2,0,1,2,2,2,3,3,4,4,6,6])
//threeSum([0,-1,1,3,-5,2])
//threeSum([9])

//threeSum([-13,11,11,0,-5,-14,12,-11,-11,-14,-3,0,-3,12,-1,-9,-5,-13,9,-7,-2,9,-1,4,-6,-13,-7,10,10,9,7,13,5,4,-2,7,5,-13,11,10,-12,-14,-5,-8,13,2,-2,-14,4,-8,-6,-13,9,8,6,10,2,6,5,-10,0,-11,-12,12,8,-7,-4,-9,-13,-7,8,12,-14,10,-10,14,-3,3,-15,-14,3,-14,10,-11,1,1,14,-11,14,4,-6,-1,0,-11,-12,-14,-11,0,14,-9,0,7,-12,1,-6])
