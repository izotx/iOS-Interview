//: Playground - noun: a place where people can play

import UIKit

/**
 You left your computer unlocked and your friend decided to troll you by copying a lot of your files to random spots all over your file system.
 
 Even worse, she saved the duplicate files with random, embarrassing names ("this_is_like_a_digital_wedgie.txt" was clever, I'll give her that).
 
 Write a function that returns an array of all the duplicate files. We'll check them by hand before actually deleting them, since programmatically deleting files is really scary. To help us confirm that two files are actually duplicates, return an array of FilePaths objects with variables for the original and duplicate paths:
 */

class FilePaths: CustomStringConvertible {
    
    let duplicatePath: String
    let originalPath: String
    
    init(duplicatePath: String, originalPath: String) {
        self.duplicatePath = duplicatePath
        self.originalPath = originalPath
    }
    
    var description: String {
        return "(original: \(originalPath), duplicate: \(duplicatePath))"
    }
}
//Brute force
// compare each file to other file/ we can serialize to data. It's expensive in terms of space and time
//

// recursively search for files in file system
// create a hash
// store it somewhere
// compare it to other file
// if hash is the same it means we found a duplicate
// Potential problems savign


func findDuplicates(root:String){
    //find files and directories that are in the root
    var filesSeenAlready: [Data: FileInfo] = [:]
    var stack: [String] = []
    stack.append(root)
    while !stack.isEmpty{
          let currentPath = stack.removeLast()
          //check if already seen
          // if not
    
    }
}




