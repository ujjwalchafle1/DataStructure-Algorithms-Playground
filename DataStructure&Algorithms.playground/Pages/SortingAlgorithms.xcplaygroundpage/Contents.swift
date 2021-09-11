//: [Previous](@previous)

//:## Elementary Sorting Algorithm
//:What is sorting?
//:- Process of rearranging the items in a collection so that the items are in some kind of order
//:**********
//:Examples
//:1. Sorting numbers from smallest to largest.
//:2. Sorting names alphabetically.
//:3. Sorting movies based on released year.
//:**********
//:Why do we need it?
//:- Sorting is an incredibly common task, so its good to know how it works
//:- There are many different ways to sort things, diff techniques have their own advantages and disadvantages.
//:**********
//: ![Visualize a Stack](BubbleSort.png)
//:**********
import Foundation

//func bubbleSort(_ arr: inout [Int]) {
//
//  for i in 0..<arr.count
//  {
//    var noSwap = true
//    for j in i+1..<arr.count
//    {
//      print(arr[i],arr[j])
//      if arr[i] > arr[j] {
//        let tempVal = arr[i]
//        arr[i] = arr[j]
//        arr[j] = tempVal
//        noSwap = false
//      }
//      print(arr)
//    }
//    if noSwap {break}
//  }
//}

//var input = [29,10,14,37,14]
//var input = [5,10,2,6]
func bubbleSort1(_ array: [Int]) -> [Int]
{
  
  var arr = array
  //  var noSwapped = true
  
  for _ in 0...arr.count
  {
    var swapped = false
    for index in 1...arr.count-1
    {
      if arr[index-1] > arr[index]
      {
        let greaterValue = arr[index-1]
        arr[index-1] = arr[index]
        arr[index]  = greaterValue
        swapped = true
      }
      print(arr)
    }
    if !swapped { break }
    
    //print(index)
  }
  return arr
}

//bubbleSort1(input)
//:**********
//:- Worst-case performance
//:O(n^{2}) comparisons,
//:O(n^{2}) swaps
//:**********
//:- Best-case performance
//:O(n) comparisons,
//:O(1) swaps
//:**********
//:- Average performance
//:O(n^{2}) comparisons,
//:O(n^{2}) swaps
//:**********
//:- Worst-case space complexity
//:O(n) total,
//:O(1) auxiliary
//:**********
//:# Selection-Sort
//:-Similar to bubble sort, but instead of first placing large values into sorted position, it places small values into sorted position
//var input = [5,10,2,6]
func selectionSort(arr : inout [Int]){
  
  for i in 0..<arr.count
  {
    var minValue = i
    for j in i+1..<arr.count
    {
      // print(arr[i],arr[j])
      if arr[minValue] > arr[j] {
        minValue = j
      }
    }
    
    // print("min - \(minValue)")
    
    let tempVal = arr[i]
    arr[i] = arr[minValue]
    arr[minValue] = tempVal
    print(arr)
  }
  
}

//selectionSort(arr: &input)
//:**********
//:- Worst-case performance
//:O(n^{2}) comparisons,
//:O(n) swaps
//:**********
//:- Best-case performance
//:O(n^{2}) comparisons,
//:O(1) swaps
//:**********
//:- Average performance
//:O(n^{2}) comparisons,
//:O(n) swaps
//:**********
//:- Worst-case space complexity
//:O(1) auxiliary
//:**********
//var input = [2,1,9,76,4]  //1

//:# Insertion-Sort
var input = [5,10,2,6]
func insertionSort(_ array: [Int]) -> [Int]
{
  var arr = array
  for i in 1..<arr.count
  {
    var position  = i
    while position > 0 && arr[position-1] > arr[position]
    {
      let tempVal = arr[position - 1]
      arr[position - 1] = arr[position]
      arr[position] = tempVal
      position -= 1
    }
    print(arr)
  }
  return arr
}

//
//func insertionSort(_ array: [Int]) -> [Int] {
//    var arr = array
//    for x in 1..<arr.count {
//        var y = x
//        while y > 0 && arr[y] < arr[y - 1] {
//          let tempVal = arr[y - 1]
//          arr[y - 1] = arr[y]
//          arr[y] = tempVal
//            y -= 1
//        }
//    }
//    return arr
//}
insertionSort(input)

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
