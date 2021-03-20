//: [Previous](@previous)

import Foundation

func swap(arr: inout [Int], a: Int, b: Int) -> [Int]
{
  let tempVal = arr[a]
  arr[a] = arr[b]
  arr[b] = tempVal
  return arr
}

var input = [100,4,8,2,1,5,7,6,3]
//var input = [7,6]
func pivot(arr: inout [Int], start: Int, end: Int) -> Int
{
  var pivotPoint = start
  print("Start- \(start), end - \(end)")
  for i in start..<end
  {
    if arr[i] < arr[start] {
      pivotPoint += 1
      arr = swap(arr: &arr, a: i, b: pivotPoint)
    }
  }

  arr = swap(arr: &arr, a: start, b: pivotPoint)
  
  return pivotPoint
}

//print(pivot(arr: &input, start: 0, end: input.count))

func quickSort(arr: inout [Int], start: Int = 0, end: Int) -> [Int]
{

  if start < end {
  
    print("get pivot-\(arr),\(start),\(end)")

    let pivotIndex = pivot(arr: &arr, start: start, end: end)
    print(pivotIndex)
  //  left
    arr = quickSort(arr: &arr, start: start, end: pivotIndex)
    print("Start right side")
  //  right
    print(arr,pivotIndex+1,end-1)
    arr = quickSort(arr: &arr, start: pivotIndex+1, end: end)
  }
  return arr
}

print(quickSort(arr: &input, end: input.count))
