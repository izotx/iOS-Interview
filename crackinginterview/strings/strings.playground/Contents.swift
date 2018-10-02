//: Playground - noun: a place where people can play

import UIKit

//1.3
//Space O(n)
//Complexity O(n)

func urlify(_ str:String)->String{
    var newArray = [Character]()
    var first = false
    
    let urlChar = Array("%20")
    
    for a in str.reversed(){
        //Check empty space
        if String(a) == " "{
            if(first){
                newArray.insert(contentsOf: urlChar, at: 0)
            }
        }
        else{
            first = true
            newArray.insert(a, at: 0)

        }
    }
    return String(newArray)
}

urlify("Ali Baba  ")


// 1.1
// O(n) complexity
func isUnique(_ string:String)->Bool{
    var set = Set<Character>()
    for char in string{
        set.insert(char)
    }
    
    return set.count == string.count
}
//1,1 a
func isUniqueNoDataStructures(_ string:String)->Bool{

    for char in string{
        var count = 0
        for char1 in string{
            if(char1 == char){
                count += 1
            }
        }
        if count > 1{
            return false
        }
    }
    return true
}
func checkPermutations(_ str1:String, _ str2:String)->Bool{
    //Permutation is the same characters but in in different order
    if(str1.count != str2.count){
        return false
    }
    
    //get all characters from str1 and b
    for char in str1{
        var count = 0
        for char1 in str1{
            if(char1 == char){
                count += 1
            }
        }
        if count == 0{
            return false
        }
    }
    
    return true
}

func testCases(){
//test 1.1
isUnique("sar")
isUnique("alib")
//test 1.2
isUniqueNoDataStructures("aas")
isUniqueNoDataStructures("alib")

//Permutations
checkPermutations("ab", "ba")
checkPermutations("ab1", "ba")
}






