import UIKit

// Bitwise AND
// The AND operation takes two bits and returns 1 if both bits are 1. Otherwise, it returns 0.
0b11 & 0b10 // → 2
0b1 & 0b0 // → 0
0b0 & 0b1 // → 0
0b0 & 0b0 // → 0
0b1 & 0b1 // → 1

//Bitwise OR
//The OR operation takes two bits and returns 1 if either of the bits are 1. Otherwise, it returns 0.
0b11 | 0b10 // → 3
0b1 | 0b0 // → 1
0b0 | 0b1 // → 1
0b0 | 0b0 // → 0

//Bitwise XOR
//The XOR operation (or exclusive or) takes two bits and returns 1 if exactly one of the bits is 1. Otherwise, it returns 0.

0b1 ^ 0b1 // →  0
0b1 ^ 0b0 // →  1
0b0 ^ 0b1 // →  1
0b0 ^ 0b0 // →  0

//Bitwise Not
// The NOT bitwise operation takes one set of bits, and for each bit returns 0 if the bit is 1, and 1 if the bit is 0.
// More reading: https://en.wikipedia.org/wiki/Two%27s_complement

~0b0 // →  -1
~0b1 // →  -2

//Bit Shifting
//A bit shift moves each digit in a number's binary representation left or right. The last bit in the direction of the shift is lost, and a 00 bit is inserted on the other end.
0b0010 << 1 // →  0100
0b1011 >> 1 // →  0101

//Bit shifts take number of times to shift as the right argument:
//left shift divided by 2 to the power number of shifts, right shift divides by 2 to the power of number of shifts
0b1010110 << 2  //→  1011000 =0 344 
0b1011010 >> 3  //→  0001011

