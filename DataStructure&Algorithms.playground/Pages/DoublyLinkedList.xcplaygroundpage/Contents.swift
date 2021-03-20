//: [Previous](@previous)

import Foundation

class Node {
  var next:Node?
  var previous:Node?
  var value:Any!
  
  init(_ value: Any) {
    self.value = value
  }
}


class DoublyLinkedList {
  var length = 0
  var head:Node?
  var tail:Node?
  
  
  func push(_ value:Any)
  {
    let newNode = Node(value)
    if self.length == 0
    {
      self.head = newNode
      self.tail = newNode
    }
    else
    {
      newNode.previous = self.tail
      self.tail?.next = newNode
      self.tail = newNode
    }
    self.length += 1
  }
  
  func pop()
  {
    print("Popping now")
    if length == 0 {return}
    if length == 1 {
      print("length is 0")
      self.tail = nil
      self.head = nil
      return
    }
    let preNode = self.tail?.previous
    preNode?.next = nil
    self.tail   = preNode
    self.length -= 1
    
  }
  
  func shift()
  {
    if self.length == 0 {return}
    if self.length == 1 {
      self.head = nil
      self.tail = nil
    } else {
      self.head = self.head?.next
      self.head?.previous = nil
    }
    self.length -= 1
  }
  
  //Add item at the beginning
  func unShift(_ value: Any)
  {
    let newNode   = Node(value)
    if self.length == 0
    {
      self.head = newNode
      self.tail = newNode
    }
    else
    {
      self.head?.previous = newNode
      newNode.next  = self.head
      self.head     = newNode
    }
    self.length   += 1
  }
  
  func get(nodeAt index: Int) -> Node?
  {
    if index == self.length || index < 0 {return nil}
    print((self.length-1)/2)
    if index < (self.length-1)/2
    {
      print("This Head")
      var currentNode = self.head
      var counter = 0
      while counter != index
      {
        currentNode = currentNode?.next
        counter += 1
      }
      return currentNode
    }
    else
    {
      print("This Tail")
      var currentNode = self.tail
      var counter = self.length - 1
      while counter != index
      {
        currentNode = currentNode?.previous
        counter -= 1
      }
      return currentNode
    }
  }
  
  func set(value: Any, for index: Int)
  {
    let node = self.get(nodeAt: index)
    node?.value = value
  }
  
  func insert(value: Any, at index: Int)
  {
    let newNode = Node(value)
    
    if index == 0 {
      unShift(value)
      return
    }
    if index == length-1 {
      push(value)
      return
    }
    
    guard let currentNodeAtIndex = self.get(nodeAt: index) else {
      return
    }
    print("Node found")
    newNode.next      = currentNodeAtIndex
    newNode.previous  = currentNodeAtIndex.previous
    currentNodeAtIndex.previous?.next = newNode

    self.length += 1
  }
  
  func remove(at index: Int) -> Bool
  {
    if index == 0 {
      shift()
      return true
    }
    if index == length-1
    {
      pop()
      return true
    }
    guard let nodeToRemove = get(nodeAt: index) else {
      return false
    }
    nodeToRemove.next?.previous = nodeToRemove.previous
    nodeToRemove.previous?.next = nodeToRemove.next
    self.length -= 1
    
  return true
  }
}

extension DoublyLinkedList
{
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

let list = DoublyLinkedList()
print("head-\(String(describing: list.head?.value)), tail-\(String(describing: list.tail?.value)), length-\(list.length)")

list.push(1)
list.push(2)
list.push(3)
list.push(4)
list.push(5)
list.push(6)

print("head-\(String(describing: list.head?.value)), tail-\(String(describing: list.tail?.value)), length-\(list.length)")

print("head next-\(String(describing: list.head?.next?.value)), tail previous-\(String(describing: list.tail?.previous?.value)), length-\(list.length)")
//list.push(100)


print("head-\(String(describing: list.head?.value)), tail-\(String(describing: list.tail?.value)), length-\(list.length)")

print("head next-\(String(describing: list.head?.next?.value)), tail previous-\(String(describing: list.tail?.previous?.value)), length-\(list.length)")
list.printList()

//MARK: POP
//list.pop()

//print("After popping - head next-\(String(describing: list.head?.next?.value)), tail previous-\(String(describing: list.tail?.previous?.value)), length-\(list.length)")
//
//list.printList()
//
//
//list.pop()
//
//list.printList()
//
//
//list.pop()
//print(list.length)
//list.printList()
//print(list.head?.value)
//
//list.pop()
//print(list.length)


//MARK: SHIFT
//list.shift()
//list.printList()
//print("head next-\(String(describing: list.head?.next?.value)), tail previous-\(String(describing: list.tail?.previous?.value)), length-\(list.length)")
//
//list.shift()
//list.printList()
//print("head next-\(String(describing: list.head?.next?.value)), tail previous-\(String(describing: list.tail?.previous?.value)), length-\(list.length)")
//
//list.shift()
//list.printList()
//print("head next-\(String(describing: list.head?.next?.value)), tail previous-\(String(describing: list.tail?.previous?.value)), length-\(list.length)")


//MARK: UNSHIFT
//list.unShift(101)
//list.printList()
//print("head next-\(String(describing: list.head?.next?.value)), tail previous-\(String(describing: list.tail?.previous?.value)), length-\(list.length)")
//
//list.unShift(102)
//
//list.printList()
//print("head next-\(String(describing: list.head?.next?.value)), tail previous-\(String(describing: list.tail?.previous?.value)), length-\(list.length)")


//MARK: GET
//let node = list.get(nodeAt: 3)
//print(node?.value)


//MARK: SET
//list.set(value: 0, for: -1)
//list.printList()


//MARK: INSERT
//list.insert(value: "newValue", at: 5)
//list.printList()
//print("head next-\(String(describing: list.head?.next?.value)), tail previous-\(String(describing: list.tail?.previous?.value)), length-\(list.length)")

//: ## Remove
//list.remove(at: 0)
//list.printList()
//list.remove(at: 0)
//list.printList()
//list.remove(at: 0)
//list.printList()
//list.remove(at: 0)
//list.printList()
//list.remove(at: 0)
//list.printList()
//list.remove(at: 0)
//list.printList()
//list.remove(at: 0)
//list.printList()
//print("head- \(String(describing: list.head?.value)), head next-\(String(describing: list.head?.next?.value)), tail previous-\(String(describing: list.tail?.previous?.value)), tail- \(list.tail?.value), length-\(list.length)")

//: [Next Topic](@next)
//: ## Second Level Heading
//:   ##    Second Level Heading

//: ## Level 2 Heading Using Number Signs (`#`)
