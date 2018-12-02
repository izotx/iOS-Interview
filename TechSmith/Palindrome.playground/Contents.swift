import UIKit

//what is a palindrome? It's a string that is read in the same backwards as forward.
//
//Option one iterate through characters and comparing pairs
/*
 while left < right
    let el = string[left]
    let el = string[right]
    left++
    right--
    if(el1 != el2[
        return false
    }
 */


//second option is couting characters. So what really palindrome is? It's a string that cointains at most 1 character repeated uneven number of times.
//
/**
    create a dictionary
 let dict = [String:Int]
 for char in String{
    if dict.contains[char]{
        dict[char] ++
    }
    else
        dict[char] = 1
 }
 //Second pass that determines how many uneven characters
 var count = 0;
 for d in dict{
    if d%2 != 0 count ++
 
 }
 return count<=1;
 
 It will either compare all or
 */
func palindrome(string:String)->Bool{
    var left = string.startIndex;
    var right = string.index(before: string.endIndex)
    
    while left < right{
        let leftEl = String(string[left]).uppercased()
        let rightEl = String(string[right]).uppercased()
        print(leftEl)
        print(rightEl)
        
        if leftEl != rightEl{
            return false
        }
    left = string.index(after: left)
    right = string.index(before: right)
    }
    return true
}

palindrome(string: "AbßBA") // True
palindrome(string: "AbßcBA") // false



