//: [Previous](@previous)

import Foundation

//: # Heaps
//:Objectives:
//:**********
//:What is Binary Heap
//:- Very similar to Binary Search Tree but with some different rules!
//:- In a MaxBinaryHeap , parent nodes are always larger than child nodes.
//:- In MinBanaryHeap, parent nodes are always smaller than child nodes.
//:**********
//:Max Binary Heap:
//:- Each parent has at most 2 childs
//:- value of parent node is always greater than child nodes
//:- But There is no guarantees between sibling nodes.
//:- A Binary heap is as compact as possible.
//:- All the childs of each node are as full as they can be &
//:- left childs are filled out first
//:**********
//:Implement basic methods on heap
//: Representing Heaps:
//:Insert pseudocode

class MaxBinaryHeap
{
  
  var values = [Int]()
  
  
  //to get the parent index
  //substract 1 from newNode(child) index (total array count - 1)
  //and then divid by 2
  //this will give the parent of the newNode
  
  //now if the newNode value is less than parent value
  //break the loop
  
  //if newNode value is great than parent then
  //swap newNode with parent node
  //also swap the index
  
  func insert(value: Int)
  {
    values.append(value)
    
    var childIndex  = values.count - 1
    
    
    while true
    {
      let parentIndex = Int(floor(Double((childIndex - 1)/2)))
      
   //   print(parentIndex)
      
      if value <= values[parentIndex] {break}
      
      let oldParent = values[parentIndex]
      values[parentIndex] = value
      values[childIndex] = oldParent
      childIndex = parentIndex
      
      
      if parentIndex == 0 {break}
    }
    
    print(values)
  }
  
  
  //removing max value
  //take the 0th index value which will be always max
  //take the last added value by removing the last object
  //if array count is still greater than 0
  //set arr[0] = last added value
  //and sinkdown
  func extractMax() -> Int?
  {
    if values.isEmpty {return nil}
    let max = values[0]
    print(values.count)
    let end = values.popLast()
    if values.count > 0 {
      values[0] = end!
      sinkDown()
    }
    print(values)
    return max
  }
  
  func sinkDown()
  {
    var idx = 0
    let lenght = values.count
    let element = values[0]
    
    while true
    {
      let leftChildIndex  = (2*idx)+1
      let rightChildIndex = (2*idx)+2
      var swapedIndex:Int?
      
      if (leftChildIndex < lenght) {
        if values[leftChildIndex] > element {
          swapedIndex = leftChildIndex
        }
      }
      
      if (rightChildIndex < lenght)
      {
        if (swapedIndex == nil && values[rightChildIndex] > element) ||
            (swapedIndex != nil && values[rightChildIndex] > values[leftChildIndex])
        {
          swapedIndex = rightChildIndex
        }
      }
      if swapedIndex == nil { break }
      
      values[idx] = values[swapedIndex!]
      values[swapedIndex!] = element
      idx = swapedIndex!
      print(values)
    }
  }
}

let heap = MaxBinaryHeap()
heap.insert(value: 100)

heap.insert(value: 19)
heap.insert(value: 36)

heap.insert(value: 17)
heap.insert(value: 12)

heap.insert(value: 25)
heap.insert(value: 5)
heap.insert(value: 100)
heap.insert(value: 25)
heap.insert(value: 5)

heap.extractMax()
heap.extractMax()
heap.extractMax()
heap.extractMax()
heap.extractMax()
heap.extractMax()
heap.extractMax()

heap.extractMax()
heap.extractMax()
heap.extractMax()
//:**********
//:Understand where heaps are used in real world and what other data structures can be cnstructed from heaps
//:- Binary Heaps are used to implement Priority Queues, which are very commonly used data structures.
//:- Also used quite a bit, with graph traversal algorithms.
//:**********


//:## Priority Queues
//: A data structure where each element has a priority.
//:Elements with higher priority are served before elements with lower priority.


//:**********
//:# Big O of HEAPS
//:- Inserion - O(log n)
//:- Removal -  O(log n)
//:- Searching - O(n)
//:**********

//: [Next](@next)
