//: [Previous](@previous)



//123
func reverse(_ x: Int) -> Int {
  var input = x
  var res = 0;
  while (input != 0) {
    res = res * 10 + input % 10;
    input = input / 10;
  }
  
  if (res < Int32.min || res > Int32.max) {
    return 0;
  } else {
    return res;
  }
}


//: [Next](@next)
