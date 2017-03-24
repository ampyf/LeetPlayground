//: Playground - noun: a place where people can play

import UIKit



extension String {
    func characterAtIndex(idx : Int) -> Character {
        let index = self.index(self.startIndex, offsetBy: idx)
        return self[index]
    }
    
}

func palindrome(_ s: [Character], l: Int, r : Int) -> [Character] {
    var left = l, right = r
   print ("A: \(left) \(right)")
    while left >= 0 && right < s.count && s[left] == s[right] {
       print ("A1: \(s[left])) \(s[right]))")
        left -= 1
        right += 1

    }
    print ("B: \(left) \(right)")
    
    var outString : [Character] = [s[l]]
    if left != l && right != r {
        left += 1
        right -= 1
        outString = Array(s[left...right])
    }
    

 //   print ("Out \(outString)")
    return outString
}

func longestPalindrome(_ s: String) -> String {
    
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
    
    print (longestPalindrome)
    return String(longestPalindrome)
}

longestPalindrome("cbbd")
longestPalindrome("babad")
//longestPalindrome("civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth")
//longestPalindrome("kztakrekvefgchersuoiuatzlmwynzjhdqqftjcqmntoyckqfawikkdrnfgbwtdpbkymvwoumurjdzygyzsbmwzpcxcdmmpwzmeibligwiiqbecxwyxigikoewwrczkanwwqukszsbjukzumzladrvjefpegyicsgctdvldetuegxwihdtitqrdmygdrsweahfrepdcudvyvrggbkthztxwicyzazjyeztytwiyybqdsczozvtegodacdokczfmwqfmyuixbeeqluqcqwxpyrkpfcdosttzooykpvdykfxulttvvwnzftndvhsvpgrgdzsvfxdtzztdiswgwxzvbpsjlizlfrlgvlnwbjwbujafjaedivvgnbgwcdbzbdbprqrflfhahsvlcekeyqueyxjfetkxpapbeejoxwxlgepmxzowldsmqllpzeymakcshfzkvyykwljeltutdmrhxcbzizihzinywggzjctzasvefcxmhnusdvlderconvaisaetcdldeveeemhugipfzbhrwidcjpfrumshbdofchpgcsbkvaexfmenpsuodatxjavoszcitjewflejjmsuvyuyrkumednsfkbgvbqxfphfqeqozcnabmtedffvzwbgbzbfydiyaevoqtfmzxaujdydtjftapkpdhnbmrylcibzuqqynvnsihmyxdcrfftkuoymzoxpnashaderlosnkxbhamkkxfhwjsyehkmblhppbyspmcwuoguptliashefdklokjpggfiixozsrlwmeksmzdcvipgkwxwynzsvxnqtchgwwadqybkguscfyrbyxudzrxacoplmcqcsmkraimfwbauvytkxdnglwfuvehpxd")
