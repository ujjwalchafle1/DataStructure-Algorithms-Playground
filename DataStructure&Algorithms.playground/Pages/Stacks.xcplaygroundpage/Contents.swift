//: [Previous](@previous)
import Foundation

//: # Stacks + Queue

//: #### What is Stack?
//: Abstract data sturctures. LIFO data structures!
//: The last element added to the stack will be the first element removed from the stack.
//: ![Visualize a Stack](Stacks.png)

//: #### Where Stacks are used?
//: Managing function invocations, Undo/Redo, Routing is trreated as stack

class Node
{
  var value: Any,
      next: Node?
  
  init(_ value: Any) {
    self.value = value
  }
}

class Stack
{
  var first:Node?, last:Node?
  var length = 0
  
  //This is unshift method from linked list
  //to add element at the beginning of stack
  func push(_ value: Any)
  {
    let newNode = Node(value)
    if length == 0
    {
      self.first = newNode
      self.last  = newNode
    }
    else
    {
      newNode.next = self.first
      self.first   = newNode
    }
    length += 1
  }
  
  //This is shift method from linked list
  //to remove element at the beginning of stack
  func pop()
  {
    if length <= 0 {return}
    let first = self.first?.next
    self.first = nil
    self.first = first
    length -= 1
    if length == 0
    {
      self.first = nil
      self.last  = nil
    }
  }
}

extension Stack
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

let stack = Stack()

stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)
/// 4<-3<-2<-1
stack.printList()

stack.pop()
/// 3<-2<-1
stack.printList()

//: # Big O of Stacks
//: Insertion      - O(1)
//:
//: Removal     - O(1)
//:
//: Searching   - O(N)
//:
//: Access        - O(N)
//: [Next](@next)
