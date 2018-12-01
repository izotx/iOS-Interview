import UIKit

var str = "Hello, playground"
struct A{
    var name:String
    var age:Int
    init(_ name:String, _ age:Int) {
        self.name = name
        self.age = age
    }
}


let a = A("A", 12)
var array = [A]()
array.append(a)
var b = array.removeLast()
b.name = "aa"
a.name
b.name


