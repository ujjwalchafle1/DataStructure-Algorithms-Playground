//: [Previous](@previous)

import Foundation

func getDigit(num: Int,place: Int) -> Int
{
  return  Int(abs(num)) / Int(pow(Double(10),Double(place))) % 10
//  print(Int(pow(Double(10),Double(place))))
//  print(Int(abs(num)) / Int(pow(Double(10),Double(place))))
//  print(digit)
}

//getDigit(num: 1423, place: 0)

//10 x 10 = 100 x 10 = 1000 x 10 = 10000


func digitCount(num: Int) -> Int
{
  if num == 0 {return 1}
  let count = Int(floor(Double(log10(Double(num))))) + 1
  //print(count)
  return count
}

//digitCount(num: 1000)


func mostDigits(nums: [Int]) -> Int
{
  var maxDigit = 0
  for i in 0..<nums.count
  {
    maxDigit = Int(max(maxDigit, digitCount(num: nums[i])))
  }
  return maxDigit
}

//print(mostDigits(nums: [123,44,5667]))

var input = [12,34,667,88865,4,0,1]
func radixSort(nums: inout [Int])
{
  let maxDigit = mostDigits(nums: nums)

  for k in 0..<maxDigit
  {
    var digitBuckets = Array(repeating: [], count: 10)
    
    for i in 0..<nums.count
    {
      let index = getDigit(num: nums[i], place: k)
      digitBuckets[index].append(nums[i])
    }
    print(digitBuckets)
    print(digitBuckets.reduce([], +))
    nums = digitBuckets.reduce([], +) as! [Int]
    
    print(nums)
  }
}

radixSort(nums: &input)
