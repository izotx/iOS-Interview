//: Playground - noun: a place where people can play

import UIKit

/**
 Each round, players receive a score between 0 and 100, which you use to rank them from highest to lowest. So far you're using an algorithm that sorts in O(n\lg{n})O(nlgn) time, but players are complaining that their rankings aren't updated fast enough. You need a faster sorting algorithm.
 
 Write a function that takes:
 
 an array of unsortedScores
 the highestPossibleScore in the game
 and returns a sorted array of scores in less than O(n\lg{n})O(nlgn) time.
 
 For example:
 
 let unsortedScores = [37, 89, 41, 65, 91, 53]
 let highestPossibleScore = 100
 
 let sortedScores = sortScores(unsortedScores, withHighest: highestPossibleScore)
 // sortedScores: [91, 89, 65, 53, 41, 37]
 
 We’re defining nn as the number of unsortedScores because we’re expecting the number of players to keep climbing.
 
 And, we'll treat highestPossibleScore as a constant instead of factoring it into our big O time and space costs because the highest possible score isn’t going to change. Even if we do redesign the game a little, the scores will stay around the same order of magnitude.
 */





let unsortedScores = [37, 89, 41, 65, 91, 53]
let highestPossibleScore = 100
//betterSortScores(unsortedScores, withHighest: highestPossibleScore)
let sortedScores = sortScores(unsortedScores, withHighest: highestPossibleScore)



