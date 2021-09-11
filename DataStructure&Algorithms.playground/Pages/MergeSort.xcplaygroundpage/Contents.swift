//: [Previous](@previous)

import Foundation

var arr1 = [2,9]
var arr2 = [1,4,7,8,99]
//       _       _
//[1,4,7,8]   [2,9,10,11]
//[1,2]
func merge(arr1: [Int], arr2: [Int]) -> [Int]
{
  var mergedArr:[Int] = []
  var i = 0
  var j = 0
  
  while i < arr1.count && j < arr2.count {
    if arr1[i] < arr2 [j] {
      mergedArr.append(arr1[i])
      i += 1
    } else {
      mergedArr.append(arr2[j])
      j += 1
    }
  }

  while j < arr2.count {
    mergedArr.append(arr2[j])
    j += 1
  }
  while i < arr1.count {
    mergedArr.append(arr1[i])
    i += 1
  }
  print(mergedArr)
  return mergedArr
}

//merge(a: arr1, b: arr2)


func mergeSort(arr: [Int]) -> [Int]
{
  if arr.count   <= 1 {return arr}

  let midPoint    = arr.count/2
  
  let firstHalf   = mergeSort(arr: Array(arr[..<midPoint]))
  let secondHalf  = mergeSort(arr: Array(arr[midPoint...]))
  
  return merge(arr1: firstHalf, arr2: secondHalf)
}

print(mergeSort(arr: [5,2,8, 1, 29,0,4,1]))


