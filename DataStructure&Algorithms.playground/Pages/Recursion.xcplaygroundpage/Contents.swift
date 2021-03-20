//: A UIKit based Playground for presenting user interface
  
import Foundation

let abc = "hello"


//power - which gives the power of the base to the exponent
//inputs - base value and exponent value
//return - power integer


func power(base: Int,exponent: Int) -> Int
{
  var power = base
  for _ in 1..<exponent {
    power *= base
  }
  return power
}

// 2^3 = 2*2*2 = 8
func power1(base: Int,exponent: Int) -> Int
{
  var power = base //2  //4   //16
  if exponent == 0 {
    return power
  } else {
    //power *= power //4//16  4//16                 2//1
    power *= power1(base: base, exponent: exponent-1)
//                          2               3   = 4 * 2
//                                       2               2      = 2 * 2
//                                              *  2               1      = 2
  }
  return power
}

power1(base: 2, exponent: 4)


func factorial(num : Int) -> Int{
  var factorial1 = num
  if factorial1 > 1 {
    factorial1 *= factorial(num: num - 1)
  } else {
    return factorial1
  }
  return factorial1
}

factorial(num: 7)

//[1,2,3] = 6
func product(arr : inout [Int]) -> Int
{

  var productValue = 0
  
  func product1(a : Int)
  {
    productValue = a
  }
  
  if arr.count > 0 {
    product1(a: arr.last!)
    arr.removeLast()
    productValue *= product(arr: &arr)
  }
  
  return productValue
}

var arr: [Int] = []
product(arr: &arr)


func recursiveRange(number : Int) -> Int
{
  if number == 0 {
    return 0
  }
  return number + recursiveRange(number: number-1)
}


recursiveRange(number: 3)


//1,   1,2,3,5,8,.....
func fib(target: Int) -> Int
{
  if target <= 2 {
    return 1
  }
  return fib(target: target-1) + fib(target: target-2)
}

fib(target: 3)
