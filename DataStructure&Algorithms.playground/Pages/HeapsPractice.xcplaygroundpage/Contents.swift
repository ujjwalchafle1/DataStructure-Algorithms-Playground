//: [Previous](@previous)

import Foundation

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
  
  createMaxBinaryHeap(nums)
  var kthMax:Int?
  for _ in 0..<k+1{
    kthMax = extractMax()!
  }
  return kthMax!
}

var values:[Int] = []
//[3,2,3,1,2,4,5,5,6]
func createMaxBinaryHeap(_ arr: [Int])
{
  func insert(_ val: Int)
  {
    values.append(val)
    var childIndex = values.count - 1
    
    while true
    {
      let parentIndex = Int(floor(Double((childIndex-1)/2)))
      
      if val <= values[parentIndex] {break}
      
      let currentParent = values[parentIndex]
      values[parentIndex] = values[childIndex]
      values[childIndex] = currentParent
      
      childIndex = parentIndex
      
      if parentIndex == 0 {break}
    }
  }
  
  for i in arr { insert(i) }
  print(values)
}

func extractMax() -> Int?
{
  if values.isEmpty {return nil}
  var max = values[0]
  var end = values.removeLast()
  
  if values.count > 0 {
    values[0] = end
    sinkDown()
  }
  return max
}

func sinkDown()
{
  var index = 0
  let length = values.count
  let element = values[0]
  
  while true
  {
    var swappedIndex:Int?
    
    let rightIndex = (index*2)+1
    let leftIndex = (index*2)+2
    
    if leftIndex < length {
      if element < values[leftIndex] {
        swappedIndex = leftIndex
      }
    }
    
    if rightIndex < length
    {
      if ((swappedIndex == nil && element < values[rightIndex]) || (swappedIndex != nil && values[rightIndex] < values[leftIndex])) {
        swappedIndex = rightIndex
      }
    }
    
    if swappedIndex == nil {break}
    
    values[index] = values[swappedIndex!]
    values[swappedIndex!] = element
    index = swappedIndex!
  }
}


findKthLargest([3,2,3,1,2,4,5,5,6], 4)
//: [Next](@next)
