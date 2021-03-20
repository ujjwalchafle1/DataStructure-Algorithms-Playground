//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
var input = [1,3,5,6,7,8,9,20]

func binarySearch(arr:[Int], target: Int) -> Int
{
  
  var minVal = 0
  var maxVal = arr.count-1
  for _ in arr {
    let midVal = Int(maxVal-minVal/2)
    print(midVal)
    if arr[midVal] == target {
      return midVal
    }
    else
    {
      if target > arr[midVal] {
        minVal = midVal + 1
      } else {
        maxVal = midVal - 1
      }
    }
  }
  return -1
}

binarySearch(arr: input, target: 3)
