//: [Previous](@previous)

import Foundation

var arr1 = [2,9]
var arr2 = [1,4,7,8,99]
//       _       _
//[1,4,7,8]   [2,9,10,11]
//[1,2]
func merge(a: [Int], b: [Int]) -> [Int]
{
  var mergedArr:[Int] = []
  var i = 0
  var j = 0
  
  while i < a.count && j < b.count {
    if a[i] < b [j] {
      mergedArr.append(a[i])
      i += 1
    } else {
      mergedArr.append(b[j])
      j += 1
    }
  }

  while j < b.count {
    mergedArr.append(b[j])
    j += 1
  }
  while i < a.count {
    mergedArr.append(a[i])
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
  
  return merge(a: firstHalf, b: secondHalf)
}

print(mergeSort(arr: [4,100,9,8,55,68,30,22,0,1000,6]))
