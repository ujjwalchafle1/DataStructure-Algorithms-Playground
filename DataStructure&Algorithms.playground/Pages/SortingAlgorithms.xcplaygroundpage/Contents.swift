//: [Previous](@previous)

import Foundation

func bubbleSort(arr: inout [Int]) {

  for i in 0..<arr.count
  {
    var noSwap = true
    for j in i+1..<arr.count
    {
      print(arr[i],arr[j])
      if arr[i] > arr[j] {
        let tempVal = arr[i]
        arr[i] = arr[j]
        arr[j] = tempVal
        noSwap = false
      }
    }
    if noSwap {break}
  }
  print(arr)
}

//[1,2,4,5,7,0]
//bubbleSort(arr: &input)


func selectionSort(arr : inout [Int]){
  
  for i in 0..<arr.count
  {
    var minValue = i
    for j in i+1..<arr.count
    {
      print(arr[i],arr[j])
      if arr[minValue] > arr[j] {
        minValue = j
      }
    }
    
    print("min - \(minValue)")

    let tempVal = arr[i]
    arr[i] = arr[minValue]
    arr[minValue] = tempVal
  }
  print(arr)
}

//selectionSort(arr: &input)

var input = [2,1,9,76,4]  //1
func insertionSort(arr: inout [Int])
{
 
  for i in 1..<arr.count
  {
    let currentValue = arr[i]
    var position = i
    
    while position > 0 && arr[position-1] > arr[i]
    {
      arr[i] = arr[position-1]
      position -= 1
    }
    arr[position] = currentValue
  }
  print(arr)
}

insertionSort(arr: &input)

var optional:String?
//optional = "ujjwal"

while let str = optional {
  print(str)
  break
}

func insertionSort(arr1: inout [Int])
{
  print("Yes allowed")
}

insertionSort(arr1: &input)
