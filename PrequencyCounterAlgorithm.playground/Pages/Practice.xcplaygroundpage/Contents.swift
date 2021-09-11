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
//var arr1 = [1,3,4,4]
//arr1.
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
  
  var frequency: [String:(previous: String,occurance: Int)] = [:]
  var previousChar = ""
  
  for char in str1 {
    if frequency[String(char)] != nil {
      let currentChar = frequency[String(char)]!
      frequency[String(char)]! = (currentChar.previous, currentChar.occurance + 1)
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
      
      if currentChar.previous.isEmpty {
        if currentChar.occurance != 0 {
          return false
        } else {
          frequency[tempStr] =  (currentChar.previous, currentChar.occurance - 1)
        }
      } else {
        let previousChar = frequency[currentChar.previous]
        if previousChar!.occurance != 0 {
          return false
        } else {
          frequency[tempStr] =  (currentChar.previous, currentChar.occurance - 1)
        }
      }
    }
  }
  return true
}
var input = "abc", input2 = "abcabcbb"
isSubSequence(str1: &input, str2: &input2)
