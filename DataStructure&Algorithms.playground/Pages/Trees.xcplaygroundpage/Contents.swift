//: [Previous](@previous)
import Foundation

//: # Trees
//: #### What is Tree?
//: Data structure that consists of nodes that are in parent-child relationship.🤱🏻
//: ![Visualize a Stack](Trees.png)
//: ![Visualize a Stack](SinglyList-Trees.png)
//: ![Visualize a Stack](Not-Tree.png)
//: ![Visualize a Stack](Not-Tree1.png)
//:**********
//:## Tree Terminology :
//:Root - Top node in a tree.
//:
//:Child - A node directly connected to another node when moving away from the root.
//:
//:Parent - Converse notion of child
//:
//:Siblings - A group of nodes with the same parent.
//:
//:Leaf - A node with  no childs.
//:
//:Edge - The connection between one node and another.
//:**********
//:## Usage of Trees
//:1. Network routing
//:2. Folder Structure
//:3. AI
//:4. JSON
//:**********
//: ## Kinds of Trees
//:- Trees
//:- Binary Trees - Each node will have max of two childs
//:- Binary Search Trees - Special case of binary trees. Store data that can be compared, added in someway.
//: ![Visualize a Stack](BST.png)
//:
//:Wiki - A binary search tree (BST), also called an ordered or sorted binary tree, is a rooted binary tree whose internal nodes each store a key greater than all the keys in the node's left subtree and less than those in its right subtree
//:**********
//:## How BST work?
//:- Every parent node has at most two childs
//:- Every node to the left of parent node is always less than parent
//:- Every node to the right of parent node is always greater than parent
//:**********
//: #### Compare and contrast trees and list -
//: List - Linear   | Trees - non-linear
//:**********
//: #### Difference between trres, binary trees and binary search trees -
//: #### Implement oprations on Binary search trees **BSD** -
//:**********
//There tow options : 1. Building Queues with Arrays, 2. Building Queues with Classes

class Node
{
  var value: Int
  var right:Node?
  var left:Node?
  
  init(_ value:Int) {
    self.value = value
  }
}

class BinarySearchTree
{
  var root:Node?
  
  func insert(_ value:Int)
  {
    if self.root == nil {
      self.root = Node(value)
    }
    else
    {
      let newNode = Node(value)
      var currentNode = self.root
      
      while true {
        if value > currentNode!.value
        {
          if currentNode!.right != nil {
            currentNode = currentNode!.right
          } else {
            currentNode!.right = newNode
            return
          }
        }
        else
        {
          if currentNode!.left != nil {
            currentNode = currentNode!.left
          } else {
            currentNode!.left = newNode
            return
          }
        }
      }
      
      //::Recursive solution::
//      func setNode(node: Node)
//      {
//        if node.value < value
//        {
//          if node.right != nil {
//            setNode(node: node.right!)
//          } else {
//            node.right = newNode
//          }
//        }
//        else
//        {
//          if node.left != nil {
//            setNode(node: node.left!)
//          } else {
//            node.left = newNode
//          }
//        }
//      }
//
//      setNode(node: self.root!)
    }
  }
  
  func search(_ value:Int) -> Bool
  {
    guard let currentNode = self.root else { return false }
    if currentNode.value == value { return true }
    //::Recursive solution::
    func foundNode(node: Node) -> Bool
      {
        if node.value < value
        {
          guard let right = node.right else { return false }
          return right.value == value ? true : foundNode(node: right)
        }
        else
        {
          guard let left = node.left else { return false }
          return left.value == value ? true : foundNode(node: left)
        }
      }
    
    return foundNode(node: currentNode)
  }
  
  
}


var bst   = BinarySearchTree()
bst.insert(25)
bst.insert(30)
bst.insert(2)
bst.insert(35)
bst.insert(100)
bst.insert(26)

bst.insert(1)

//bst.root?.right = Node(30)
//bst.root?.right?.right = Node(32)
//bst.root?.right?.left = Node(29)
//
//bst.root?.left = Node(10)
//bst.root?.left?.right = Node(15)
//bst.root?.left?.left = Node(7)

print(bst.root?.value)
print(bst.root?.right?.value)
print(bst.root?.right?.right?.value)
print(bst.root?.right?.right?.left?.value)

print(bst.root?.left?.value)

print(bst.root?.left?.right?.value)

bst.search(25)

//:**********
//:# Big O of BST
//:- Inserion - O(log n)
//:- Searching - O(log n)
//:
//:NOT Guaranteed
//:**********
//: # Tree Traversal
//:  Tree traversal (also known as tree search and walking the tree) is a form of graph traversal and refers to the process of visiting (checking and/or updating) each node in a tree data structure, exactly once.
//:
//: Such traversals are classified by the order in which the nodes are visited.
//: ## Two Ways:
//:- Breadth-first Search - BFS
//:
//: ![Visualize a Stack](TT1.png)
//:- Depth-first Search (InOrder, PreOrder, PostOrder) - DFS
//:- PreOrder - visit node 1st -> visit complete right -> visit complete left
//:- PostOrder - visit node later ->
extension BinarySearchTree
{
  func BFS() -> [Any]
  {
    var node = self.root,
        queue:[Node] = [],
        data:[Any] = []
    
    queue.append(node!)
    
    while (queue.count != 0) {
      node = queue.removeFirst()
      data.append(node!.value)
      if ((node?.left) != nil) { queue.append((node?.left)!)}
      if ((node?.right) != nil) { queue.append((node?.right)!)}
    }
    return data
  }
  
  func DFSPreOrder() -> [Int]
  {
    var data:[Int] = [],
        current = self.root
    
    func traverse(node: Node)
    {
      data.append(node.value)
      if node.left != nil { traverse(node: node.left!)}
      if node.right != nil { traverse(node: node.right!)}
    }
    traverse(node: current!)
    return data
  }
  
  func DFSPostOrder() -> [Int]
  {
    var data:[Int] = [],
        current = self.root
    
    func traverse(node: Node)
    {
      if node.left != nil { traverse(node: node.left!)}
      if node.right != nil { traverse(node: node.right!)}
      data.append(node.value)
    }
    traverse(node: current!)
    return data
  }
  
  func DFSInOrder() -> [Int]
  {
    var data:[Int] = [],
        current = self.root
    
    func traverse(node: Node)
    {
      if node.left != nil { traverse(node: node.left!)}
      data.append(node.value)
      if node.right != nil { traverse(node: node.right!)}
    }
    traverse(node: current!)
    return data
  }
  
}
bst.BFS()
bst.DFSPreOrder()
bst.DFSPostOrder()

bst.DFSInOrder()

//: [Next](@next)
