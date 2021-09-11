//: [Previous](@previous)

import Foundation

class Solution {
  var values:[Node] = []
  func topKFrequent(_ nums: [Int], _ k: Int) -> [Int]
  {
    var frequency:[String:Int] = [:]
    for i in nums
    {
      if frequency[String(i)] != nil{
        frequency[String(i)]! += 1
      } else {
        frequency[String(i)] = 1
      }
    }
    print(frequency)
    for i in frequency.keys.sorted() {
      enqueue(String(i), frequency[i]!)
      if values.count > k {
        values.removeLast()
      }
    }
    
    var mostFrequent:[Int] = []
    for _ in 0..<k{
      let node = dequeue()!
      mostFrequent.append(node)
    }
    return mostFrequent
  }
  
  func enqueue(_ val: String,_ freq: Int)
  {
    let node = Node(val, freq)
    values.append(node)
    
    var childIndex = values.count-1
    
    while true
    {
      let parentIndex = Int(floor(Double((childIndex-1)/2)))
      if node.frequency <= values[parentIndex].frequency {break}
      
      let currentParent = values[parentIndex]
      values[parentIndex] = node
      values[childIndex] = currentParent
      childIndex = parentIndex
      
      if parentIndex == 0 {break}
    }
    // print(values.count)
    
  }
  
  func dequeue() -> Int?
  {
    for i in values {
      print(i.val!)
    }
    guard !values.isEmpty else {return nil}
    let max = values[0]
    let end = values.removeLast()
    
    if values.count > 0 {
      values[0] = end
      sinkDown()
    }
    return Int(max.val!)
  }
  
  func sinkDown()
  {
    var index = 0
    var length = values.count
    var element = values[0]
    
    while true
    {
      let leftIndex = (index*2)+1
      let rightIndex = (index*2)+2
      
      var swappedIndex: Int?
      
      if leftIndex < length {
        if element.frequency < values[leftIndex].frequency {
          swappedIndex = leftIndex
        }
      }
      
      if rightIndex < length {
        if swappedIndex == nil && element.frequency > values[rightIndex].frequency || swappedIndex != nil && values[rightIndex].frequency > values[leftIndex].frequency {
          swappedIndex = rightIndex
        }
      }
      
      if swappedIndex == nil {break}
      
      values[index] = values[swappedIndex!]
      values[swappedIndex!] = element
      index  = swappedIndex!
    }
  }
}

class Node {
  var val:String?
  var frequency = 0
  
  init(_ value:String, _ freq: Int)
  {
    val = value
    frequency = freq
  }
}


let cls = Solution()
cls.topKFrequent([5,3,1,1,1,3,5,73,1], 3)

//[5,3,1,1,1,3,5,73,1]
//3
//[5,3,1,1,1,3,73,1]
//2



func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        
        
        var freq:[Character:Int] = [:]
        
        for i in tasks
        {
            if freq[i] != nil {
                freq[i]! += 1
            } else {
                freq[i] = 1
            }
            // print(freq[i]!)
        }
       
        for key in freq.keys {
            print(freq[key]!)
        }
        
//  var fmax = max(freq, <#[Character : Int]#>)
        return 5
    }

leastInterval(["A","A","A","B","B","B"], 2)




//: [Next](@next)
