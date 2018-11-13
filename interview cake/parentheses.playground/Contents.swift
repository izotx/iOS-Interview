import UIKit
/*
I like parentheticals (a lot).

"Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing."

Write a function that, given a sentence like the one above, along with the position of an opening parenthesis, finds the corresponding closing parenthesis.

Example: if the example string above is input with the number 10 (position of the first parenthesis), the output should be 79 (position of the last parenthesis).
*/
var input = "Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing."

//Count number of parentheses
//Count pairs
//Scan the string. Put it in the stack. Check if previous one matching closing one {{}
// stack has push and pop

//index
struct Element{
    var index:Int
    var type:type
}

enum type{
    case Open
    case Close
}

enum ParensError: Error, CustomStringConvertible {
    case noClosingParens(String)
    
    public var description: String {
        return "No closing parenthesis"
    }
}


func parentheses(_ word:String)->[Int]{
    
    var parentheses = Array(repeating: -1, count: word.count - 1)
    
    //index and type (open or close)
    var stack = [Element]()

    for (index, character) in word.enumerated()
    {
        //Opening so append to the list
        if String(character) == "("{
            stack.append(Element(index: index, type: .Open))
        }
        if String(character) == ")"{
            //check if previous one was open. If not throw error?
            //Let's assume that it was open in this case we have one complete case
            if stack.count > 0 {
                let last = stack.removeLast()
                if last.type == type.Open{
                    //that's a good case
                    parentheses[last.index] = index
                }
            }
        }
    }
    
    return parentheses
}

let p = parentheses(input)
p[10]

