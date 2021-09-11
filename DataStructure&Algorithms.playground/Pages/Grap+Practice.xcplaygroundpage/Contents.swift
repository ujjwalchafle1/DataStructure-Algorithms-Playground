//: [Previous](@previous)

import Foundation

var adjanencyList: [Character:[Character]] = [:]
var countsList: [Character:Int] = [:]


func alienOrder(_ words: [String]) -> String
{
  for i in 0..<words.count-1
  {
    for j in 0..<min(Array(words[i]).count, Array(words[i+1]).count)
    {
      if Array(words[i])[j] != Array(words[i+1])[j]
      {
        // adjanencyList.append(words[i][j])
        if adjanencyList[Array(words[i])[j]] == nil {
          adjanencyList[Array(words[i])[j]] = [Array(words[i+1])[j]]
        } else {
          adjanencyList[Array(words[i])[j]]?.append(Array(words[i+1])[j])
        }

        if countsList[Array(words[i+1])[j]] == nil {
          countsList[Array(words[i+1])[j]] = 0
        } else {
          countsList[Array(words[i+1])[j]]! += 1//.append(Array(words[i+1])[j])
        }
        break
      }
    }
  }
  
  // print(adjanencyList.keys.count)
  for key in adjanencyList.keys
  {
    print("\(key) - \(adjanencyList[key]!)")
  }
  
//  for key in countsList.keys
//  {
//    print("\(key) - \(countsList[key]!)")
//  }
  
  
  //String builder
  var result = ""
  var queue:[Character] = []
  
  for key in countsList.keys
  {
    print("\(key) - \(countsList[key]!)")
    if countsList[key]! == 0 {
      queue.append(key)
    }
  }
  print("queue-\(queue)")
  while !queue.isEmpty
  {
    let char = queue.removeLast()
    result += String(char)
    print("char-\(char)")
    let arr = adjanencyList[char] != nil ? adjanencyList[char]! : []
    for i in arr
    {
      print("queue1-\(i)")
      countsList[i]! -= 1
      if countsList[i]! == 0
      {
        queue.append(i)
      }
    }
  }
  
  if result.count < countsList.count {
    ""
  }

  return result
}

alienOrder(["wrt","wrf","er","ett","rftt"])

//: [Next](@next)



class Solution {
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        
        if intervals.isEmpty {return 0}
        
        var queue:[Int] = []
        
        var sortedIntervals = intervals.sorted {
            (a,b) -> Bool in
            a[0] < b[0]
        }
        
        queue.append(sortedIntervals[0][1])
        
        for i in 1..<sortedIntervals.count {
            if sortedIntervals[i][0] >= queue.first! {
                queue.removeFirst()
            }
            queue.append(sortedIntervals[i][1])
        }
        
        return queue.count
    }
}
