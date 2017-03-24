//: Playground - noun: a place where people can play

import Foundation

func myAtoi(_ str: String) -> Int {
    
    guard str.characters.count > 0 else {
        return 0
    }
    
    // remove white space
    var aStr = str.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
    
    // 1st non-white space char should be +,- or number
    let firstChar = aStr[aStr.startIndex]
    let multiplier = firstChar == "-" ? -1 : 1
    if ["+","-"].contains(firstChar)  {
        aStr = aStr.substring(from: aStr.index(after: aStr.startIndex))
    }
    
    // index 1 to ? should be integral
    // once non-digit chars are encountered, ignore the rest at the end
    
    var integral = ""
    for char in aStr.characters {
        if let _ = Int(String(char)) {
            integral.append(char)
        } else {
            break
        }
    }
    
    // if integral number is beyond the range, return INT32_MAX or INT32_MIN
    if integral.characters.count > 10 {
        return multiplier == 1 ? Int(Int32.max) : Int(Int32.min)
    }
    
    // get numeric representation
    if var xInt = Int(integral) {
        xInt = xInt * multiplier
        // if out of range, return INT32_MAX or INT32_MIN
        if xInt > Int(Int32.max) {
            return Int(Int32.max)
        }
        if xInt < Int(Int32.min) {
            return Int(Int32.min)
        }
        return xInt
    }

    return 0
}

func isWhiteSpace(_ c : Character) -> Bool {
    return [" ","\n", "\t"].contains(c)
}

func isSign(_ c : Character) -> Bool {
    return ["+","-"].contains(c)
}


func isDigit(_ c : Character) -> Bool {
    if let _ = Int(String(c)) {
        return true
    }
    return false
}

func myAtoi2(_ str: String) -> Int {
    
    guard str.characters.count > 0 else {
        return 0
    }
    
    // remove white space
    
    var firstCharFound = false  // first non-white space char
    var integral = ""
    var multiplier = 1

    for char in str.characters {
        if !firstCharFound {
            if !isWhiteSpace(char) {
                firstCharFound = true
                if  isSign(char){
                    multiplier = char == "-" ? -1 : 1
                } else if isDigit(char) {
                    integral.append(char)
                } else {
                    return 0
                }

            } // else do nothing
        } else {
            if isDigit(char) {
                if integral.characters.count < 10 {
                    integral.append(char)
                } else {
                    return multiplier == 1 ? Int(Int32.max) : Int(Int32.min)
                }
            } else {
                break
            }

        }
    }
    
    // get numeric representation
    if var xInt = Int(integral) {
        xInt = xInt * multiplier
        // if out of range, return INT32_MAX or INT32_MIN
        if xInt > Int(Int32.max) {
            return Int(Int32.max)
        }
        if xInt < Int(Int32.min) {
            return Int(Int32.min)
        }
        return xInt
    }
    
    return 0
}


    


myAtoi2("")
myAtoi2("+")
myAtoi2("5")
myAtoi2("  -0012a42")
myAtoi2("9223372036854775809")
myAtoi2("    010")
