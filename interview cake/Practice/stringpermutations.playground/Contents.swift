import UIKit

var str = "Hello, playground"

var permutations = Set<String>()
func stringPermutations(input:String)->Set<String>{
    guard input.characters.count > 0 else {
        return []
    }
    
    // base case
    guard input.characters.count != 1 else {
        return [input]
    }

    let index = input.index(before: input.endIndex)
    let allCharsButLast = input.substring(to: index)
    let lastChar = input.last!
    
    let permutationsOfAllCharsExceptLast = getPermutations(for: allCharsButLast)
    
    
    
    
    
    return permutations
}
