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

class WeightedGraph
{
  var adjacencyList:[String:[Any]] = [:]
  
  func addVertex(_ vertex: String)
  {
    if adjacencyList[vertex] == nil {
      adjacencyList[vertex] = []
    }
    print(adjacencyList)
  }
  
  func addEdge(_ v1: String,_ v2: String,_ weight: Int)
  {
    adjacencyList[v1]?.append((v2, weight))
    adjacencyList[v2]?.append((v1, weight))
    
    print(adjacencyList)
  }
  
  func dijkstras(start: String, finish: String)
  {
    let queue = PriorityQueue()
    var distance:[String:Int] = [:]
    var previous:[String:String] = [:]
    
    var path:[String] = []
    
    var smallest:String = ""
    
    //setup initail state
    for vertex in adjacencyList.keys
    {
      if vertex == start {
        distance[vertex] = 0
        queue.enqueue(value: vertex, priority: 0)
      } else {
        distance[vertex] = Int.max
        queue.enqueue(value: vertex, priority: Int.max)
      }
      
      previous[vertex] = nil
      print(queue.values)
    }
    
//    var smallest:(String,Int)?
    while !queue.values.isEmpty {
      smallest = queue.dequeue()?.value as! String
      
      if smallest == finish {
        //we are done here
        while (previous[smallest] != nil) {
          path.append(smallest)
          smallest = previous[smallest]!
        }
        break
      }
      

      print("smallest \(smallest)")

      if distance[smallest] != Int.max
      {
        for neighbour in adjacencyList[smallest]!
        {
         // print(adjacencyList[smallest.0])
          print("neighbour of \(smallest) is \(neighbour)")
          let currentNeightbour:(String,Int) = neighbour as! (String,Int)
          let currentNeighnourDistanceFromStart = distance[smallest]! + currentNeightbour.1

          print("currentNeightbour \(currentNeightbour.0)")
//          let nextNeighbour = currentNeightbour.0
//          print("nextNeighbour \(nextNeighbour)")

          if currentNeighnourDistanceFromStart < distance[currentNeightbour.0]!
          {
            distance[currentNeightbour.0] = currentNeighnourDistanceFromStart
            previous[currentNeightbour.0] = smallest
            queue.enqueue(value: currentNeightbour.0, priority: currentNeighnourDistanceFromStart)
          }
        }
      }
      
    }
    print(path)
    print(Array(path.reversed()))
    //
    
  }
  
}

var graph =  WeightedGraph()
graph.addVertex("A");
graph.addVertex("B");
graph.addVertex("C");
graph.addVertex("D");
graph.addVertex("E");
graph.addVertex("F");

graph.addEdge("A","B", 4);
graph.addEdge("A","C", 2);
graph.addEdge("B","E", 3);
graph.addEdge("C","D", 2);
graph.addEdge("C","F", 4);
graph.addEdge("D","E", 3);
graph.addEdge("D","F", 1);
graph.addEdge("E","F", 1);


graph.dijkstras(start: "A", finish: "E")
//: [Next](@next)
