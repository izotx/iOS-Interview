import UIKit

/**
 Implement a function that takes in a 32 bit integer and returns another 32 bit unsigned integer that is the floor of the square root of the input
 */

func root(_ input:Int32 )->Int32?{
    //Base case
    if(input == 0){return 0}
    if(input == 1){return 1}


    var left:Int32 = 0
    var right = input
    var middle = (right + left) / 2
    
    while left < right {
        
        let tempResult = middle * middle
        //left middle right
        if tempResult == input{ // Voila. Root found
            return middle
        }
        else if tempResult > input{ // Too big
            right = middle - 1
        }
        else{//too small
            left = middle + 1
        }
            middle = (right + middle) / 2
    }
    
    
    return nil
}

//Testing
root(4) // 2
root(2) // nil
root(9) // 3
