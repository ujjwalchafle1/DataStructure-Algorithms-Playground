/*
Suppose we have some input data describing a graph of relationships between parents and children over multiple generations. The data is formatted as a list of (parent, child) pairs, where each individual is assigned a unique positive integer identifier.

For example, in this diagram, 3 is a child of 1 and 2, and 5 is a child of 4:

1   2    4   15
 \ /   / | \ /
  3   5  8  9
   \ / \     \
    6   7    11


Sample input/output (pseudodata):

parentChildPairs = [
    (1, 3), (2, 3), (3, 6), (5, 6), (15, 9),
    (5, 7), (4, 5), (4, 8), (4, 9), (9, 11)
]


Write a function that takes this data as input and returns two collections: one containing all individuals with zero known parents, and one containing all individuals with exactly one known parent.


Output may be in any order:

findNodesWithZeroAndOneParents(parentChildPairs) => [
  [1, 2, 4, 15],       // Individuals with zero parents
  [5, 7, 8, 11]        // Individuals with exactly one parent
]

Complexity Analysis variables:

n: number of pairs in the input
*/

import Foundation;


let parentChildPairs = [
  [1, 3], [2, 3], [3, 6], [5, 6], [15, 9],
  [5, 7], [4, 5], [4, 8], [4, 9], [9, 11]
]


func getRootNodes(_ inputArr: [[Int]]) -> [Int] {
  
  var rootNodes: [Int] = []
  
  for i in 0..<inputArr.count {
    var isPresent = false
    for j in 1..<inputArr.count {
      if inputArr[i][0] == inputArr[j][1] {
        isPresent = true
      }
    }
    
    if !isPresent {
      if !rootNodes.contains(inputArr[i][0]) {rootNodes.append(inputArr[i][0])}
    }
  }
  return rootNodes
}
//print(getRootNodes(parentChildPairs))

func getSingleParentChild(_ inputArr: [[Int]]) -> [Int] {
  
  var frequency: [Int: Int] = [:]
  var childNodes: [Int] = []

  for i in inputArr {
    if frequency[i[1]] != nil {
      frequency[i[1]]! += 1
    } else {
      frequency[i[1]] = 1
    }
  }
    print(frequency)
  
  for key in frequency.keys
  {
    if frequency[key] == 1 {
      childNodes.append(key)
    }
  }

  return childNodes
}

//print(getSingleParentChild(parentChildPairs))

func getNodesWithZeroAndOneParents(_ inputArr: [[Int]]) -> ([Int], [Int]) {
  return (getRootNodes(inputArr), getSingleParentChild(inputArr))
}

print(getNodesWithZeroAndOneParents(parentChildPairs))
