import UIKit

let str = "Hello"
let str2 = "eHoll"

func isAnangram(str1:String, str2:String)-> Bool
{
  
  if str1.count != str2.count {
    return false
  }
  
  var frequency1 : [Character : Int] = [:]
  
  for char in str1 {
    if (frequency1[char] != nil) {
      frequency1[char]! += 1
    }else{
      frequency1[char] = 1
    }
  }
  print(frequency1)
  for char in str2 {
    
    if let _ = frequency1[char] {
      frequency1[char]! -= 1
    }
    else {
      return false
    }
  }
  print(frequency1)
  return true
}

isAnangram(str1: str, str2: str2)


var numbers = [-10,-4,-1,0,1,10]

//return arr of two numbers whose sum is zero

func isSumZero(arr:[Int]) -> [Int] {
  
  var left  = 0
  var right = arr.count-1
  for _ in arr {
    let sum = arr[left] + arr[right]
    if sum == 0 {
      return [arr[right],arr[left]]
    } else if sum > 0{
      right -= 1
    } else if sum < 0{
      left += 1
    }
  }
  return []
}

isSumZero(arr: numbers)

func isSumPresent(arr:[Int], target:Int) -> [Int] {
  
  var left  = 0
  var right = arr.count-1
  for _ in arr {
    let sum = arr[left] + arr[right]
    if sum == target {
      return [arr[right],arr[left]]
    } else if sum > target{
      right -= 1
    } else if sum < target{
      left += 1
    }
  }
  return []
}

isSumPresent(arr: numbers, target: 8)

//count of unique numbers
var basket = [1,2,3,4,5,5,5,5,6,7,7]
func countUniqueValues(arr: inout [Int]) -> Int {
  
  if arr.count == 0 {return 0}
  
  var firstPointer = 0
  var secondCounter = 1
  for _ in arr
  {
    if arr.count > secondCounter && arr[firstPointer] != arr[secondCounter] {
      firstPointer += 1
      arr[firstPointer] = arr[secondCounter]
    }
    secondCounter += 1
  }
  print(arr)
  return firstPointer+1
}

countUniqueValues(arr: &basket)

//max sum of consecutive  numbers
func maxSumOfConsecutiveNumber(arr: [Int], target:Int) -> Int {
  var maxSum = 0
  var tempSum = 0
  for (item, index) in arr.enumerated() {
    if index > target {
      tempSum += item
    }
  }
  maxSum = tempSum
  for (_, index) in arr.enumerated() {
    tempSum = tempSum - arr[index - target] - arr[index]
    maxSum = max(maxSum, tempSum)
  }
  return maxSum
}

//maxSumOfConsecutiveNumber(arr: basket, target: 2)



func dotsAnimations(isLoading:Bool)
{
  var maxDots = 0
  var dots = ""
  while isLoading {
    //  withAnimation(.easeIn(duration: 5)){
    if maxDots <= 3 {
      dots += "."
      maxDots += 1
    }
    else {
      dots = ""
      maxDots = 0
    }
    print("Loading \(dots)")
    //      }
  }
}

dotsAnimations(isLoading: true)
