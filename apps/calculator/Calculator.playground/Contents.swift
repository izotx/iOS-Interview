//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 Questions:
    How do we read the value from the button?
    How do we represent the fractions, exponents,roots, log and etc.
    What if the last input is an expression?
    How do we handle decimals?
 
 Classes Involved
 ViewController:
    passing commands to the model
 View
    Buttons
    UserInput
    Result
    Errors/Messages
    Current//Last Operation
 
 ViewModel
    UserInput

 Calculator Class - responsible for
    parsing the user input and commands
    keeping the commands on the stack
    evaluates the expression and gives feedback
 
    What's current expression? How to reset it?
        In case of simple calculator, it will be: last digit before operand and current digits
        In case more complicated one, evaluate all input
 
 UserInput
    Operand
    Digit

 
 Command Class
    High level abstraction of command
 
 Example of user behavior
  // Empty State
        User presses +
    Calculator evaluates it as:
    // Calculate current input on the screen as 0
    // Recognize + as a commend. Don't display anything
    //Case 1. User presses - or any other operands
        That will replace current operation on the stack??? with this operand
    //Case 2.
        User p resses a digit.
        1. If there was a previous result??? how do we know it -> Because user presses =/Calculate button.It will replace the result with a new number
        2. There was nothing. We will just replace it with a new digit.
        3. There was digit. Just add a digit to last digit string and display it on the screen.
 //
*/

class UserInput
{
    var paramaters:[UserInput] = [UserInput]()
    func evaluate(){
        
    }
}

enum CommandType{
    case evaluate
    case command
    case clearAll
    case removeLastDigit
}

class Command:UserInput{
    let type:CommandType
    init(type:CommandType) {
        self.type = type
    }
}

class Digit:UserInput{
    
}


class Stack{
    var array = [UserInput]()
    func push(_ input:UserInput){
        array.append(input)
    }

    func pop()->UserInput?{
        if array.count > 0{
            array.removeLast()
        }
        return nil
    }
    
    func peek()->UserInput?{
        return array.last
    }
 }

class Queue{
    
}


class Calculator{
    private var stack = Stack()
    
    //Operations responsible for both stack of commands, queue for evalueations
    private var operations = [UserInput]()
    private var currentExpression = [UserInput]()
    
    
    
    func calculateResult(){
        //get all the digits and commands since last result or since beginning
        //check if the last input was result
        guard let k = stack.peek(), k is Command else{
            return
        }
        
        if k as! Command
        
        
        var expression = [UserInput]()
        
        while let input = stack.peek()
        {
            expression.insert(input, at: 0)
            
        }
    }
    
    //TODO: add return statement to it 
    func evaluateCommand(command:Command){
        switch command.type {
        case .evaluate: //calculate the result
            stack.push(command)
            calculateResult()
            break
        case .command:
            //if it is we have two choices
            //revert last operation and replace it with current operation
            if let k = stack.peek(), k is Command{
                //replace command
                stack.pop()
            }
            stack.push(command)
            break
        }
        
      
        
        //or take result of a previous operation and use it as a base of a new expression

    }
    
    func addToExpression(userInput:UserInput)->(Bool,String){
        
        if userInput is Command{
            evaluateCommand(command: userInput as! Command)
        }
        else{
            stack.push(userInput)
        }

        return (true,"")
    }
    
}


//Calculator Class - responsible for
//    parsing the user input and commands
//keeping the commands on the stack
//evaluates the expression and gives feedback
//
//What's current expression? How to reset it?
//In case of simple calculator, it will be: last digit before operand and current digits
//In case more complicated one, evaluate all input

