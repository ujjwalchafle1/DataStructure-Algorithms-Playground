//: [Previous](@previous)
//https://cs.slides.com/colt_steele/tries-21

import Foundation
//: [Next](@next)
var input = [1,3,5,6,7,8,9] //7

//min=0
//max=5

//mid=5/2=2

//arr[2]/5 < 7 {min=mid/2+1}
//min=3

//mid=3+5/2=4


func binarySearch(arr:[Int], target: Int) -> Int?
{
  
  var minVal = 0
  var maxVal = arr.count-1

  
  while minVal < maxVal
  {
    let midVal = Int((maxVal+minVal)/2)
    print(midVal)
    if arr[midVal] < target {  minVal = midVal + 1  }
    else if arr[midVal] > target {  maxVal = midVal - 1 }
    else { return midVal }
  }
  
  return nil
}

binarySearch(arr: input, target: 7)
