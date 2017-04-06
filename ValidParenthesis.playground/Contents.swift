//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Split string into array
// Create a stack object
// if character is in opening {([, push to stack
// if character is closing })], pop from stack
// compare that closing is match for opening

    func isValid(_ s: String) -> Bool {
        
        let matchDictionary : [Character : Character] = [")" : "(", "}" : "{", "]" : "["]
        let opening = matchDictionary.values
        let closing = matchDictionary.keys
        
        var stack = [Character]()
        
        
        for (_, char) in s.characters.enumerated() {
            if opening.contains(char) {
                stack.append(char)
            } else if closing.contains(char) {
                if let openMatch = stack.last, matchDictionary[char] == openMatch {
                    stack.removeLast()
                } else {
                    // not a match
                    return false
                }
            }
        }
        
        return stack.isEmpty
    }

isValid("(]")
isValid("([)]")
isValid("()[]{}")
isValid("()")