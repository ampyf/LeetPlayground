//: Playground - noun: a place where people can play

import UIKit

/*
 func isPalindrome(s: [Character]) -> Bool {
 let lastIdx = s.count - 1
 let midPoint = Int(floor(Double(s.count/2)))
 
 for i in 0...midPoint {
 if s[i] != s[lastIdx-i] {
 return false
 }
 }
 return true
 }
 
func isPalindrome(s: [Character]) -> Bool {
    let lastIdx = s.count - 1
    let midPoint = Int(floor(Double(s.count/2)))
    
    let s1End = midPoint > 0 ? midPoint-1 : 0
    
    let s2Start = midPoint <= 0 ? 0 : (s.count % 2 == 0 ? midPoint : midPoint+1)

//    print ("\(s.count) \(midPoint) \(s1End) \(s2Start)")
    
    let s1 = Array(s[0...s1End])
    let s2 = Array(Array(s[s2Start...lastIdx]).reversed())
//    print ("\(s1) \(s2)")
    return s1 == s2
}
*/

/*
 public class Solution {
 public String longestPalindrome(String s) {
 String result = "";
 for(int i=0; i<s.length(); i++){
 String str = palindrome(s, i, i);
 if(result.length() < str.length())
 result = str;
 str = palindrome(s, i, i+1);
 if(result.length() < str.length())
 result = str;
 }
 return result;
 }
 
 String palindrome(String s, int left, int right){
 
 while(left>=0 && right<s.length() && s.charAt(left) == s.charAt(right)){
 left--;
 right++;
 }
 return s.substring(left+1,right);
 }
 }
 */

func palindrome(_ sArray: [Character], l: Int, r : Int) -> [Character] {
    var left = l, right = r
    while left >= 0 && right < sArray.count && sArray[left] == sArray[right] {
        left -= 1
        right += 1
    }
    return Array(sArray[left...right])
}

func longestPalindrome(_ s: String) -> String {
    print ("here")
    if s.characters.count == 0 {
        return ""
    }
    
    
    let sArray = Array(s.characters)
    var longestPalindrome = [Character]()
    
    for i in 0..<sArray.count {
        var temp = palindrome(sArray, l: i, r: i)
        if temp.count > longestPalindrome.count {
            longestPalindrome = temp
        }
        temp = palindrome(sArray, l: i, r: i+1)
        if temp.count > longestPalindrome.count {
            longestPalindrome = temp
        }
    }
    
    print (String(longestPalindrome))
    return String(longestPalindrome)
}

longestPalindrome("cbbd")

/*
func longestPalindrome(_ s: String) -> String {
    let sArray = Array(s.characters)
    var longestPalindrome = [Character]()
    
    for length in (1...sArray.count).reversed() {
        for i in 0...sArray.count-length {
            let subarray = Array(sArray[i..<i+length])
            if subarray.count > longestPalindrome.count {
                if isPalindrome(s: subarray) {
                    longestPalindrome = subarray
                }
            } else {
                return String(longestPalindrome)
            }
        }
    }
    return String(longestPalindrome)
}
*/

/*
func longestPalindrome(_ s: String) -> String {
    let sArray = Array(s.characters)
    let count = sArray.count
    var longestPalindrome = [Character]()
    
    for i in 0..<count {
        var workingArray = [Character]()
        for j in i..<count {
            workingArray.append(sArray[j])
            if isPalindrome(s: workingArray) {
                if workingArray.count > longestPalindrome.count {
                    longestPalindrome = workingArray
                }
            }
        }
    }
    return String(longestPalindrome)
}

*/
//longestPalindrome("babad")
//longestPalindrome("civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth")
