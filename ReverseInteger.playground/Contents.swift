//: Playground - noun: a place where people can play

import UIKit

func isInt32Overflow(_ x:Int) -> Bool {
    let max32 =  Int(INT32_MAX), min32 = Int(INT32_MAX) * -1
    if x > max32 || x < min32 {
        return true
    }
    return false
}

    func reverse(_ x: Int) -> Int {
        
        let multiplier = x < 0 ? -1 : 1
        var reversed = 0
        var inX = abs(x)
        
        while inX > 0 {
            let lastDigit = inX % 10
            reversed = reversed * 10 + lastDigit
            if isInt32Overflow(reversed * multiplier) {
                return 0
            }
            print (inX, " ", lastDigit," ",reversed)
            inX = inX / 10
        }
        
        return reversed * multiplier
    }

reverse(-123)
//reverse(1534236469)
//reverse(19)
//reverse(10)
//reverse(1000)
