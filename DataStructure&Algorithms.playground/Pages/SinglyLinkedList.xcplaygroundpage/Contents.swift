//: [Previous](@previous)

import Foundation

class Node
{
  var value:Any?
  var next:Node?
  
  init(_ value: Any?)
  {
    self.value = value
    self.next = nil
  }
}

//let node = Node("Hi")
//node.next = "Ujjwal"
////node.next.next = "Ujjwal"
//
////print(node.value)
////print(node.next)

class SinglyLinkedList
{
  var head: Node?
  var tail: Node?
  var length = 0
  
  //Add item at the end
  func push(_ value: Any)
  {
    let node = Node(value)
    if self.head == nil
    {
      self.head = node
      self.tail = self.head
    }
    else
    {
      self.tail?.next = node
      self.tail = node
      //self.head?.next = self.tail
    }
    self.length += 1
  }
  
  //Remove item from the end
  func pop()
  {
    if length == 0 {return}
    var currentNode = self.head
    var previousNode = currentNode
    
    while ((currentNode?.next) != nil)
    {
      previousNode = currentNode
      currentNode = currentNode?.next
    }
    self.tail = previousNode
    self.tail?.next = nil
    self.length -= 1
    if length == 0 {
      self.head = nil
      self.tail = nil
    }
  }
  
  //Remove item from the beginning
  func shift()
  {
    if length == 0 {return}
    let currentHead = self.head
    self.head = currentHead?.next
    length -= 1
    if length == 0 {
      self.tail = nil
    }
  }
  
  //Add item at the begining
  func unShift(_ value:Any)
  {
    let newHead = Node(value)
    if self.head == nil {
      self.head = newHead
      self.tail = self.head
    } else {
      newHead.next = self.head
      self.head = newHead
    }
    self.length += 1
  }
  
  func get(index:Int) -> Node?
  {
    if self.length == 0 || index < 0 {return nil}
    if index == 0 {return self.head!}
    
    var currentNode = self.head
    
    for _ in 0..<index {
      currentNode = currentNode?.next
    }
    return currentNode
  }
  
  func set(value: Any, for index:Int) -> Node?
  {
    let node = get(index: index)
    node?.value = value
    return node
  }
  
  func insert(value: Any, at index: Int) -> Bool
  {
    
    if index < 0 || index > self.length {return false}
    
    if index == 0 {
      unShift(value)
    } else if index == self.length{
      push(value)
    }
    else
    {
      let newNode       = Node(value)
      let previousNode  = get(index: index-1)
      let nextNode      = previousNode?.next

      previousNode?.next = newNode
      newNode.next       = nextNode
      self.length       += 1
    }
    
    
    return true
  }
  
  func remove(at index: Int)
  {
    if index < 0 || index > self.length-1 {return}
    if index == 0 {self.shift()}
    if index == self.length-1 {self.pop()}
    else
    {
      let previousNode    = self.get(index: index-1)
      let removeNode      = previousNode?.next
      previousNode?.next  = removeNode?.next
      
      self.length -= 1
    }
  }
  
  func reverse()
  {
    var node  = self.head
    self.head = self.tail
    self.tail = node
    
    var nextNode:Node?
    var preNode:Node?
    
    for _ in 0..<self.length
    {
      nextNode = node?.next
      node?.next  = preNode
      preNode = node
      node = nextNode
    }
  }
  
  func printList()
  {
    var arr:[Any] = []
    var current = self.head
    while (current != nil) {
      arr.append(current?.value!)
      current = current?.next
    }
    print(arr)
  }
}

let list = SinglyLinkedList()
list.push("1")
list.push("2")
list.push("3")
list.push(6969)

print(list.head?.next?.next?.next?.value)
//
print("head-\(list.head?.value), tail-\(list.tail?.value), length-\(list.length)")
//print(list.tail?.next?.value)

//MARK: POP
//list.pop()
//print("head-\(list.head?.value), tail-\(list.tail?.value), length-\(list.length)")
//list.pop()
//print("head-\(list.head?.value), tail-\(list.tail?.value), length-\(list.length)")
//list.pop()
//print("head-\(list.head?.value), tail-\(list.tail?.value), length-\(list.length)")
//list.pop()
//print("head-\(list.head?.value), tail-\(list.tail?.value), length-\(list.length)")
//list.pop()
//print("head-\(list.head?.value), tail-\(list.tail?.value), length-\(list.length)")

///Shift
//list.shift()
//print("head-\(list.head?.value), tail-\(list.tail?.value), length-\(list.length)")
//
//list.shift()
//print("head-\(list.head?.value), tail-\(list.tail?.value), length-\(list.length)")
//
//list.shift()
//print("head-\(list.head?.value), tail-\(list.tail?.value), length-\(list.length)")

//
//list.shift()
//print("head-\(list.head?.value), tail-\(list.tail?.value), length-\(list.length)")

//list.shift()
//print("head-\(list.head?.value), tail-\(list.tail?.value), length-\(list.length)")

//list.unShift(0)
//print("head-\(list.head?.value),next-\(list.head?.next?.value), tail-\(list.tail?.value), length-\(list.length)")
//
//list.unShift(-1)
//print("head-\(list.head?.value),next-\(list.head?.next?.value), tail-\(list.tail?.value), length-\(list.length)")

//MARK: GET
//let node = list.get(index: 1)
//print(node?.value)

//MARK: SET
let node = list.set(value: 4, for: 8)
print(node?.value)
//
//print("head-\(list.head?.value), tail-\(list.tail?.value), length-\(list.length)")

//MARK: Insert
//list.insert(value: 10, at: 0)
//print("head-\(list.head?.value), tail-\(list.tail?.value), length-\(list.length)")
//
//var node = list.get(index: 4)
//print(list.length)
//print(node?.value)
//
//list.remove(at: 4)
//print(list.length)
//print(node?.value)
//
//
//node = list.get(index: 3)
//print(list.length)
//print(node?.value)

list.printList()

list.reverse()

list.printList()

print("head-\(list.head?.value), tail-\(list.tail?.value), length-\(list.length)")
