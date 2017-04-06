//: Playground - noun: a place where people can play

import UIKit

/*
 
 Given a m x n matrix, if an element is 0, set its entire row and column to 0. Do it in place.
 
 click to show follow up.
 
 Follow up:
 Did you use extra space?
 A straight forward solution using O(mn) space is probably a bad idea.
 A simple improvement uses O(m + n) space, but still not the best solution.
 Could you devise a constant space solution?
 

 */

func setZeroes(_ matrix: inout [[Int]]) {
 
    // identify row and column to be set to zeroes
    var rowsToZeroOut = [Int]()
    var colsToZeroOut = [Int]()
    
    for i in 0..<matrix.count {
        let row = matrix[i]
        for j in 0..<row.count {
            if row[j] == 0 {
                rowsToZeroOut.append(i)
                colsToZeroOut.append(j)
            }
        }
    }
    
    // set rows to zeroes
    for (_, r) in rowsToZeroOut.enumerated() {
        let row = matrix[r]
        for c in 0..<row.count {
            matrix[r][c] = 0
        }
    }
    
    // set columns to zeroes
    for (_, c) in colsToZeroOut.enumerated() {
        for r in 0..<matrix.count {
            matrix[r][c] = 0
        }
    }
}

var input = [[0,1]]
setZeroes(&input)
input
