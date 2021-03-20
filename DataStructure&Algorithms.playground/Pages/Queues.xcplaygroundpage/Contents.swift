//: [Previous](@previous)

import Foundation

//: # Queue

//: #### What is Queue?
//: A FIFO data structures!
//: The last element added to the stack will be the first element removed from the stack.

//: #### Where Queues are used in programming?
//: Background Task, Uploading reources, printing tasks.

//There tow options : 1. Building Queues with Arrays, 2. Building Queues with Classes

class Node
{
  var value: Any
  var next: Node?
  
  init(_ value: Any) {
    self.value = value
  }
}

class Queue
{
  var first :Node?
  var last  :Node?
  var size  = 0
  
  //Add new element to the last position
  func enqueue(_ value: Any)
  {
    let node = Node(value)
    
    if size == 0
    {
      self.first  = node
      self.last   = node
    }
    else
    {
      self.last?.next = node
      self.last       = node
    }
    size += 1
  }
  
  //remove 1st element, which is the 1st added element
  func dequeue()
  {
    if size <= 0 { return }
    
    let newFirst  = self.first?.next
    self.first    = nil
    self.first    = newFirst
    self.size     -= 1
  }
}

extension Queue
{
  func printList()
  {
    var arr:[Any] = []
    var current = self.first
    while (current != nil) {
      arr.append(current?.value as Any)
      current = current?.next
    }
    print(arr)
  }
}

var queue = Queue()

queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)

queue.printList()

queue.dequeue()

queue.printList()


//: # Big O of Queue
//: Insertion      - O(1)
//:
//: Removal     - O(1)
//:
//: Searching   - O(N)
//:
//: Access        - O(N)
