//: Playground - noun: a place where people can play

import UIKit

/// Solve Towers of Hanoi
///
/// :param: count Number of discs to move
/// :param: from  Name of original pin
/// :param: to    Name of destination pin
/// :param: other Name of third pin
/// :param: move  Function that records move of disc from pin to pin
func solveHanoi(
    _ count: Int,
    _ from: String, _ to: String, _ other: String,
    _ move: (String, String) -> ())
{
    print(count)
    if count > 0 {
        solveHanoi(count - 1, from, other, to, move)
        move(from, to)
        solveHanoi(count - 1, other, to, from, move)
    }
}

// Example: six discs
var moveCount:Int = 0
solveHanoi(3, "Left", "Right", "Middle") {
    moveCount += 1
    print("\(moveCount): Move from \($0) to \($1).")
}

/* Output:
 1: Move from Left to Middle.
 2: Move from Left to Right.
 3: Move from Middle to Right.
 4: Move from Left to Middle.
 5: Move from Right to Left.
 6: Move from Right to Middle.
 7: Move from Left to Middle.
 8: Move from Left to Right.
 9: Move from Middle to Right.
 10: Move from Middle to Left.
 11: Move from Right to Left.
 12: Move from Middle to Right.
 13: Move from Left to Middle.
 14: Move from Left to Right.
 15: Move from Middle to Right.
 16: Move from Left to Middle.
 17: Move from Right to Left.
 18: Move from Right to Middle.
 19: Move from Left to Middle.
 20: Move from Right to Left.
 21: Move from Middle to Right.
 22: Move from Middle to Left.
 23: Move from Right to Left.
 24: Move from Right to Middle.
 25: Move from Left to Middle.
 26: Move from Left to Right.
 27: Move from Middle to Right.
 28: Move from Left to Middle.
 29: Move from Right to Left.
 30: Move from Right to Middle.
 31: Move from Left to Middle.
 32: Move from Left to Right.
 33: Move from Middle to Right.
 34: Move from Middle to Left.
 35: Move from Right to Left.
 36: Move from Middle to Right.
 37: Move from Left to Middle.
 38: Move from Left to Right.
 39: Move from Middle to Right.
 40: Move from Middle to Left.
 41: Move from Right to Left.
 42: Move from Right to Middle.
 43: Move from Left to Middle.
 44: Move from Right to Left.
 45: Move from Middle to Right.
 46: Move from Middle to Left.
 47: Move from Right to Left.
 48: Move from Middle to Right.
 49: Move from Left to Middle.
 50: Move from Left to Right.
 51: Move from Middle to Right.
 52: Move from Left to Middle.
 53: Move from Right to Left.
 54: Move from Right to Middle.
 55: Move from Left to Middle.
 56: Move from Left to Right.
 57: Move from Middle to Right.
 58: Move from Middle to Left.
 59: Move from Right to Left.
 60: Move from Middle to Right.
 61: Move from Left to Middle.
 62: Move from Left to Right.
 63: Move from Middle to Right.
 */
