//: [Previous](@previous)

import Foundation

var str1 = "$$$$Hel$$$lo"
var str2 = "H$$$ello"

//helper method to remove $ from string
//check if both str length is same
//if not return false
//
//create frequency counter dictionarry
//iterate over the string elements to add each element and track the occurence of the letter in string
//create one more for look and check if the current letter is present in dict
//if yes reduce the occurence

func checkIfEqual(str1: String, str2: String) -> Bool
{
  let str1New = str1.filter {$0 != "$"}
  let str2New = str2.filter {$0 != "$"}
  
  if str1New.count != str2New.count {return false}
  
  var frequency: [Character:Int] = [:]
  
  for char in str1New {
    if frequency[char] != nil {
      frequency[char]! += 1
    } else {
      frequency[char] = 1
    }
  }
  
  print(frequency)
  for char in str2New {
    if frequency[char] != nil && frequency[char] != 0{
      frequency[char]! -= 1
    } else {
      return false
    }
  }
  print(frequency)
  return true
}

checkIfEqual(str1: str1, str2: str2)


func isSubSequence(str1: inout String, str2: inout String) -> Bool
{
  str1 = String(str1)
  str2 = String(str2)
  
  var frequency: [String:(String,Int)] = [:]
  var previousChar = ""
  
  for char in str1 {
    if frequency[String(char)] != nil {
      let currentChar = frequency[String(char)]!
      frequency[String(char)]! = (currentChar.0, currentChar.1 + 1)
    } else {
      frequency[String(char)] = (previousChar, 1)
    }
    previousChar = String(char)
  }
  print(frequency)
  
  for char in str2 {
    let tempStr = String(char)
    if frequency[tempStr] != nil
    {
      let currentChar = frequency[tempStr]!
      
      if currentChar.0.isEmpty {
        frequency[tempStr] =  (currentChar.0, currentChar.1 - 1)
      } else {
        let previousChar = frequency[currentChar.0]
        if previousChar!.1 != 0 {
          return false
        } else {
          frequency[tempStr] =  (currentChar.0, currentChar.1 - 1)
        }
      }
    }
  }
  return true
}
var input = "abdc", input2 = "abcd"
isSubSequence(str1: &input, str2: &input2)
