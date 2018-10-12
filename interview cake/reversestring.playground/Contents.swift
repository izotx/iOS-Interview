import UIKit

//In Place
func reverseStringInPlace(s:inout String){
    var leftI = s.startIndex
    var rightI = s.index(before: s.endIndex)

    while leftI < rightI{
        let leftChar = s[leftI]
        let rightChar = s[rightI]
        
        //replace left with right
        str.replaceSubrange(leftI...leftI, with: String(rightChar))
        str.replaceSubrange(rightI...rightI, with: String(leftChar))
        
        leftI = s.index(after: leftI)
        rightI = s.index(before: rightI)
    }
}

func reverseString(s:inout String){
    var leftI = s.startIndex
    var rightI = s.index(before: s.endIndex)
    
    var newWordChars = [Character]()
    
    for char in s{
        newWordChars.insert(char, at: 0)
    }
    s = String(newWordChars)
}



var str = "Hello, playground"
reverseString(s: &str)
reverseStringInPlace(s: &str)
