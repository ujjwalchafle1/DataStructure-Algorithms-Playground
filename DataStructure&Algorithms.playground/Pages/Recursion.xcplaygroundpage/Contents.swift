
import Foundation

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
  if exponent == 1 { return power }
  
    //power *= power //4//16  4//16                 2//1
    power *= power1(base: base, exponent: exponent-1)
//                          2               3   = 4 * 2
//                                       2               2      = 2 * 2
//                                              *  2               1      = 2
  return power
}

power1(base: 10, exponent: 2)


func factorial(num : Int) -> Int
{
  var factorial1 = num
  if factorial1 > 1 {
    factorial1 *= factorial(num: num - 1)
  }
  return factorial1
}

factorial(num: 4)

//[1,2,3] = 6
func product(arr : inout [Int]) -> Int
{

  var productValue = 1
  
  func setProductValue(value : Int) { productValue = value }
  
  if arr.count > 0 {
    setProductValue(value: arr.removeLast())
    productValue *= product(arr: &arr)
  }
  
  return productValue
}


var arr: [Int] = [1,2,3]
product(arr: &arr)

func recursiveRange(number : Int) -> Int
{
  if number == 0 { return 0 }
  return number + recursiveRange(number: number-1)
}

recursiveRange(number: 4)


//1,   1,2,3,5,8,.....
func fib(target: Int) -> Int
{
  if target <= 2 {
    return 1
  }
  return fib(target: target-1) + fib(target: target-2)
}

fib(target: 3)
