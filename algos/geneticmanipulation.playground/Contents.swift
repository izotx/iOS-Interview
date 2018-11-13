//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let bitVector: CFMutableBitVector = CFBitVectorCreateMutable(kCFAllocatorDefault, str.count * 2)
CFBitVectorSetCount(bitVector, str.count * 2)
print(bitVector)
CFBitVectorSetBitAtIndex(bitVector, 0, 1)
