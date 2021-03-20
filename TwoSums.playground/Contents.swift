import UIKit

var str = "Hello, playground"


class Solution {
  
  var filteredArray:[Int] = []
  
  var minValue = 0
  var maxValue = 0
  
  func twoSums(nums: [Int], target: Int) -> [Int]{
    for number in nums {
      if number <= target {
        filteredArray.append(number)
      }
    }
    maxValue = filteredArray.sorted().last!
    for number in filteredArray {
      if maxValue + number == target {
        minValue = number
        print(number)
        break
      }
    }
    var indexArray:[Int] = []
    var index = 0
    for number in nums {
      if (number == maxValue || number == minValue) && indexArray.count < 2{
        indexArray.append(index)
      }
      index += 1
    }
    return indexArray
  }
  
  
  func twoSums(nums: [Int], target: Int, p: Int){
  }
}

let a = Solution()

print(a.twoSums(nums: [2,1,1], target: 5))


func twoSumHashWay(nums: [Int], target: Int) -> [Int]?
{
  var dict:[Int:Int]
  
  for i in nums {
    var diff = target - i
    if dict.contains(where: <#T##((key: Int, value: Int)) throws -> Bool#>)
  }
  
  
  return nil
}
