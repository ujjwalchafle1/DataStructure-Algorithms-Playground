//: [Previous](@previous)

import Foundation

//: # Graphs
//:Objectives:
//:**********
//: What is Graph?
//:- A Graph is a non-linear data structure consisting of nodes and edges. The nodes are sometimes also referred to as vertices and the edges are lines or arcs that connect any two nodes in the graph.
//:- More formally a Graph can be defined as,
//:## A Graph consists of a finite set of vertices(or nodes) and set of Edges which connect a pair of nodes.
//: ![Visualize a Graph](graph.png)
//:- Vertex - nodes
//:- Edge - connection between the nodes
//:**********
//:- Undirected graph - An undirected graph is graph, i.e., a set of objects (called vertices or nodes) that are connected together, where all the edges are bidirectional. An undirected graph is sometimes called an undirected network.
//: ![Visualize a Graph](undirected.png)
//:- Directed graph - A directed graph is graph, i.e., a set of objects (called vertices or nodes) that are connected together, where all the edges are directed from one vertex to another. A directed graph is sometimes called a digraph or a directed network.
//: ![](directed.png)
//:**********
//: Weighted graph - Sometimes we want to associate some value with the edges in graph
//: So.. label all the edges with a number. That number (called the weight) could represent:
//:- Distances between two locations (cities; computers on network)
//:- Time taken to get from one node to another (stations; states in schedule or plan).
//:- Cost of traversing the edge (train fares; cost of wires)
//: ![Visualize a Graph](weighted.png)
//:**********
//: ![Visualize a Graph](weighted-unweighted.png)
//: Unweighted Graph - Weighted Graph will contains weight on each edge where as unweighted does not.
//:- Because when you doesn’t have weight, all edges are considered equal. Shortest distance means less number of nodes you travel.
//:- But in case of weighted graph, calculation happens on the sum of weights of the travelled edges.
//:**********
//: Adjacency Matrix
//: ![Visualize a Graph](matrix.png)
//:- The adjacency matrix, sometimes also called the connection matrix, of a simple labeled graph is a matrix with rows and columns labeled by graph vertices, with a 1 or 0 in position (v_i,v_j) according to whether v_i and v_j are adjacent or not.
//:-  For a simple graph with no self-loops, the adjacency matrix must have 0s on the diagonal. For an undirected graph, the adjacency matrix is symmetric.
//:**********
//: Adjacency List
//: an adjacency list consists of an array of vertices (ArrayV) and an array of edges (ArrayE), where each element in the vertex array stores the starting index (in the edge array) of the edges outgoing from each node. The edge array stores the destination vertices of each edge (Fig. 2). This allows visiting the neighbors of a vertex v by reading the edge array from ArrayV[v] to ArrayV[v + 1].
//: ![Visualize a Graph](list.png)
//:### There are other representations also like, Incidence Matrix and Incidence List. The choice of graph representation is situation-specific
//:**********
//: Uses for Graph?
//:- Social Networks
//:- Location/Maps
//:- Routing algorithms
//:- Visual Hierarchy
//:- File system optimizations
//:**********
//: Different graphs available
//: Implement a graph using an adjacency list

class Graph
{
  var adjacencyList:[String:[String]] = [:]
  
  func addVertext(vertex: String)
  {
    if adjacencyList[vertex] == nil {
      adjacencyList[vertex] = []
    }
    
    print(adjacencyList)
  }
  
  func addEdges(v1: String, v2: String)
  {
    adjacencyList[v1]?.append(v2)
    adjacencyList[v2]?.append(v1)
    
    print(adjacencyList)
  }
  
  func removeEdge(v1: String, v2: String)
  {
    adjacencyList[v1] = adjacencyList[v1]?.filter({ (vertex) -> Bool in
      return v2 as String != vertex
    })
    
    adjacencyList[v2] = adjacencyList[v2]?.filter({ (vertex) -> Bool in
      return v1 as String != vertex
    })
    print(adjacencyList)
  }
  
  func removeVertex(vertex: String)
  {
    for connectedVertex in adjacencyList[vertex]! {
      removeEdge(v1: vertex, v2: connectedVertex )
    }
    adjacencyList[vertex] = nil
    
    print(adjacencyList)
  }
  
  func DFSRecusive(start: String) -> [String]
  {
    var result: [String] = []
    var visited: [String:Bool] = [:]
    
    func dfs(vertex: String?) {
      if vertex == nil {return} else {
        visited[vertex!] = true
        result.append(vertex!)
        
       for vr in adjacencyList[vertex!]!
       {
        print("\(vr) isVisisted - \(String(describing: visited[vr]))")
        if visited[vr] == nil {
           dfs(vertex: vr )
        }
       }
      }
    }
    dfs(vertex: start)
    return result
    
  }
  
  func DFSIterative(start: String) -> [String]
  {
    var stack = [start]
    var result: [String] = []
    var visited: [String:Bool] = [:]
    var currentVertex: String?
      
    visited[start] = true
    
    while !stack.isEmpty {
      currentVertex = stack.popLast()
      result.append(currentVertex!)
      
      for vr in adjacencyList[currentVertex!]!
      {
        if visited[vr] == nil {
          visited[vr] = true
          stack.append(vr)
        }
      }
    }
    
    return result
  }
  
  func BFSIterative(start: String) -> [String]
  {
    var queue = [start]
    var result: [String] = []
    var visited: [String:Bool] = [:]
    var currentVertex: String?
      
    visited[start] = true
    
    while !queue.isEmpty {
      currentVertex = queue.removeFirst()
      result.append(currentVertex!)
      
      for vr in adjacencyList[currentVertex!]!
      {
        if visited[vr] == nil {
          visited[vr] = true
          queue.append(vr)
        }
      }
    }
    
    return result
  }
  
}

var vr = Graph()

vr.addVertext(vertex: "A")
vr.addVertext(vertex: "B")
vr.addVertext(vertex: "C")
vr.addVertext(vertex: "D")
vr.addVertext(vertex: "E")
vr.addVertext(vertex: "F")


vr.addEdges(v1: "A", v2: "B")
vr.addEdges(v1: "A", v2: "C")
vr.addEdges(v1: "B", v2: "D")
vr.addEdges(v1: "C", v2: "E")
vr.addEdges(v1: "D", v2: "E")
vr.addEdges(v1: "D", v2: "F")
vr.addEdges(v1: "E", v2: "F")

//vr.removeEdge(v1: "Nagpur", v2: "Wardha")

//vr.removeVertex(vertex: "Wardha")
//:**********
//: Traverse through graph using BFS and DFS
//print(vr.DFSRecusive(start: "A"))

print(vr.BFSIterative(start: "A"))

//:**********
//: Compare and contrast graph traversal algorithms

//: [Next](@next)
