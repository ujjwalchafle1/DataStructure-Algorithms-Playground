//: [Previous](@previous)

import Foundation

//: # Dijkstra
//:**********
//: What is Dijkstra Algorithm?
//:- Finds the shortest path between the two vertices on a graph.

//: Who was Dijkstra ?
//:- Edsger Wybe Dijkstra a dutch computer scientist, programmer, software engineer, systems scientist, science essayist, and pioneer in computing science.
//:- He helped to advance to the field of computer science from an art to academic decipline.

class PriorityQueue
{
  var values:[(String,Int)] = []
  
  func enqueue(val: String, priority: Int)
  {
    values.append((val,priority))
    sort()
  }
  
  func dequeue() -> (String,Int) {
    return values.removeFirst()
  }
  
  func sort()
  {
    values = values.sorted { (a, b) -> Bool in
      return a.1 < b.1
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
        queue.enqueue(val: vertex, priority: 0)
      } else {
        distance[vertex] = Int.max
        queue.enqueue(val: vertex, priority: Int.max)
      }
      
      previous[vertex] = nil
      print(queue.values)
    }
    
//    var smallest:(String,Int)?
    while !queue.values.isEmpty {
      smallest = queue.dequeue().0
      
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
            queue.enqueue(val: currentNeightbour.0, priority: currentNeighnourDistanceFromStart)
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
