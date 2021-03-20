import UIKit

var str = "Hello, playground"

let num1 = 3589578
let num2 = 58793852

func sameFrequency(a : Int, b : Int) -> Bool{
  
  if String(a).count != String(b).count {return false}
  
  var frequency: [Character:Int] = [:]
  
  for digit in String(a)
  {
    frequency[digit] != nil ? (frequency[digit]! += 1) : (frequency[digit] = 1)
  }
  
  print(frequency)
  
  for digit in String(b)
  {
    if frequency[digit] != nil {
      frequency[digit]! -= 1
    } else {
      return false
    }
  }
  
  print(frequency)
  return true
}

sameFrequency(a: num1, b: num2)


///Check for duplicate values

//var arr = [1,2,3,4,5,6]
//var arr = ["1","2","3","4","5","6"]
var arr = ["a","b","c"]

func areThereDuplicates<T:Comparable>(arguments : T...) -> Bool
{
//  let inputString = array.reduce("") { (result, a) -> String in
//    return "\(result)\(a)"
//  }
    var inputString: String = ""
          for argument in arguments {
            inputString += "\(argument)"
          }
  
  var frequency: [Character:Int] = [:]

  for digit in inputString
  {
    if frequency[digit] != nil && frequency[digit]! == 1{
//      frequency[digit]! += 1
      return true
    } else {
      frequency[digit] = 1
    }
  }
  print(frequency)
  return false
}

areThereDuplicates(arguments: "a","b","c","a")

func averagePair(arr : [Int], average : Float) -> Bool
{
  if arr.isEmpty {return false}
  
  var sum = 0
  var numberOfValues = 1
  //loop through arr
  for integer in arr {
    sum += integer
    print(sum)
    if Float(sum)/Float(numberOfValues) == average {
      print(Float(sum)/Float(numberOfValues))
      print(average)
      return true
    }
    numberOfValues += 1
  }
return false
}

averagePair(arr: [], average: 4)


func isSubsequence(str1: String, str2: String) -> Bool
{
  //create dictionar using str1 with number of occurance of current char, previous char
  var frequency : [String:(String, Int)] = [:]
  var isPrevious = ""
  for char in str1
  {
    if frequency[String(char)] != nil {
      let currentCount = frequency[String(char)]!
      frequency[String(char)]! = (currentCount.0, currentCount.1+1)
    } else {
      frequency[String(char)] = (isPrevious, 1)
    }
    isPrevious = String(char)
  }
  print(frequency)
  
  //iterate through 2nd str
  for char in str2 {
    //check if current char is present in dictionary
    if frequency[String(char)] != nil {
      let currentCount = frequency[String(char)]!
      //and check previous char present
      //if not present  reduce current char occurance by -1
      if currentCount.0.isEmpty {
        frequency[String(char)]! = (currentCount.0, currentCount.1-1)
      }
      //if present, check number of occurance of previous is 0
      else {
        let previous = frequency[currentCount.0]!
        if  previous.1 != 0 {
          return false
        }
        //if 0, then reduce current char occurance by -1
        else {
          frequency[String(char)]! = (currentCount.0, currentCount.1-1)
        }
      }
    }
  }
  return true
}

isSubsequence(str1: "abc", str2: "abracadabra")

func isSubsequence1(str1: String, str2: String) -> Bool {
  var i = 0;
  var j = 0;
//  if (!str1) return true;
  
  while (j < str2.count) {
    if (str2[j] == str1[i]){
      i += 1}
    if (i === str1.length) return true;
    j++;
  }
  
 
  return false;
}
