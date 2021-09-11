//: [Previous](@previous)

import Foundation

func swap(arr: inout [Int], a: Int, b: Int) -> [Int]
{
  print("a-\(a) b-\(b)")
  let tempVal = arr[a]
  arr[a] = arr[b]
  arr[b] = tempVal
  return arr
}

var input = [3,2,1,5,6,4]//[3,2,3,1,2,4,5,5,6]//[100,4,8,2,1,5,7,6,3]//[4,1,5,0]
//var input = [7,6]

//#1
//pt = 0
//[100,4,8,2,1,5,7,6,3]
//#2
//pt = 1
//[4,100,8,2,1,5,7,6,3]
//#3
//pt = 1
//[4,100,8,2,1,5,7,6,3]
//#4
//pt = 2
//[2,100,8,4,1,5,7,6,3]
//#5
//pt = 3
//[1,100,8,4,2,5,7,6,3]

func pivot(arr: inout [Int], start: Int, end: Int) -> Int
{
  let pivotPoint = arr[start]
  var swapInx = start
  print("Start- \(start), end - \(end)")
  for i in start+1..<end
  {
    print("arr[i]- \(arr[i])")
    if arr[i] < pivotPoint {
      swapInx += 1 // 1
      print("latest pivotPoint- \(pivotPoint)")
      arr = swap(arr: &arr, a: i, b: swapInx)
    }
  }

  arr = swap(arr: &arr, a: start, b: swapInx)
  
  return swapInx
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

var arr123 = quickSort(arr: &input, end: input.count)
print(arr123[arr123.count-2])
print(quickSort(arr: &input, end: input.count-1))

//[3,2,1,5,6,4]

