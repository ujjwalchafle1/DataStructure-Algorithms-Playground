//: [Previous](@previous)

import Foundation

class Node
{
  var value:Any?
  var priority:Int?
  
  init(val: Any, pri: Int) {
    value = val
    priority = pri
  }
}

class PriorityQueue
{
  
  var values = [Node]()
  
  func enqueue(value: Any, priority: Int)
  {
    let value = Node(val: value, pri: priority)
    values.append(value)
    
    var childIndex  = values.count - 1
    
    
    while true
    {
      let parentIndex = Int(floor(Double((childIndex - 1)/2)))
      
   //   print(parentIndex)
      
      if value.priority! >= values[parentIndex].priority! {break}
      
      let oldParent = values[parentIndex]
      values[parentIndex] = value
      values[childIndex] = oldParent
      childIndex = parentIndex
      
      
      if parentIndex == 0 {break}
    }
    
    print(values)
  }
  
  func dequeue() -> Node?
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
        if values[leftChildIndex].priority! < element.priority! {
          swapedIndex = leftChildIndex
        }
      }
      
      if (rightChildIndex < lenght)
      {
        if (swapedIndex == nil && values[rightChildIndex].priority! < element.priority!) ||
            (swapedIndex != nil && values[rightChildIndex].priority! < values[leftChildIndex].priority!)
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


let queue = PriorityQueue()
queue.enqueue(value: "Cold fever", priority: 1)
queue.enqueue(value: "Gunshot wound", priority: 5)
queue.enqueue(value: "High Fever", priority: 3)

print(queue.dequeue()?.priority)
print(queue.dequeue()?.priority)
print(queue.dequeue()?.priority)
print(queue.dequeue()?.priority)
//: [Next](@next)
