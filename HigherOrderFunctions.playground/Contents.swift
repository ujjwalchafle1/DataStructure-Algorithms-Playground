import UIKit

let arr = [2,4,3,1,6,8,9,0]

let ascendingArray = arr.sorted()

//print("ascendingArray - \(ascendingArray)")

//let descendingArray = arr.sorted { (a, b) -> Bool in
////  print("a = \(a)")
////  print("b = \(b)")
////  print("a > b = \(a > b)")
//
//  return a > b
//}
  
//let descendingArray = arr.sorted(by: >)
//print("descendingArray - \(descendingArray)")


//let evenNumFirstArray = arr.sorted { (a, b) -> Bool in
//  print("a = \(a)")
//  print("b = \(b)")
//  print("a % 2  = \(a % 2 )")
//
//  return a % 2 == 0
//}
//
//print("descendingArray - \(evenNumFirstArray)")

//---------------------------------------------------//

let numbersAsStrings = arr.map { (a) -> String in
  return String(a)
}

let numbersAsStrings = arr.map {String($0)}

print("numbersAsStrings - \(numbersAsStrings)")

//---------------------------------------------------//

//let numberslessThanfive = arr.filter({ (a) -> Bool in
//  a < 5
//})
//let numberslessThanfive = arr.filter {$0 < 2}
//print("numbersAsStrings - \(numberslessThanfive)")
//
//for n in arr {
//  if n < 5 {
//    //arr.append(n)
//  }
//}

//---------------------------------------------------//

//let stringsFromArr = arr.reduce("") { (result, a) -> String in
//  return result + String(a)
//}

//let stringsFromArr = arr.reduce("Result") {$0 + String($1)}
//
//print("stringsFromArr - \(stringsFromArr)")
//
//
//let greeting = "Hello, world!"
//let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
//let beginning = greeting[..<index]
//// beginning is "Hello"
//
//// Convert the result to a String for long-term storage.
//let newString = String(beginning)
//
//
//var optionalVar: String? = "1234"
//
//while let safeVar = optionalVar {
//  print(safeVar)
//  break
//}

var names = ["Nisha", "Ujjwal", "Jack", "Robin"]

func filter(by input: String) -> [String]
{
  return names.filter { (name) -> Bool in
    input.isEmpty ? true : name.contains(input)
  }
  
}

print("filtered array - \(filter(by: "Nisha"))")


let stringArray = [1,2,3,5]
//let map = stringArray.map {String($0)}
let string = stringArray.map {String($0)}.joined(separator: ",")

print(string) // prints: "BobDanBryan"

var a1: String? = "a1"
var a2: String? = "a2"
var a3: String? = "a3"
var array = [a1, a2, a3]
print(array)
// prints [Optional("a1"), Optional("a2"),Optional("a3")]
var newArray = array.compactMap( {$0} )    // use compactMap instead
print(newArray)             // prints ["a1", "a2", "a3"]
