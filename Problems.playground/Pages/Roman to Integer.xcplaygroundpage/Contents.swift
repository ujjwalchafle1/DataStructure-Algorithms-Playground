//: A Cocoa based Playground to present user interface



class Solution {
    func romanToInt(_ s: String) -> Int
    {
        let romanValues = ["M" : 1000, "D" : 500, "C" : 100, "L" : 50, "X" : 10, "V" : 5, "I" : 1]
        
        var total = 0
        var index = 0
        
        while index <= s.count-1
        {
            let currentSymbol = String(Array(s)[index])
            let currentValue  = romanValues[currentSymbol]
            
          var nextValue = 0
          
          if index + 1 <= s.count-1{
            let nextSymbol = String(Array(s)[index+1])
            nextValue = romanValues[nextSymbol]!
          }
            
            if currentValue! < nextValue
            {
                total += nextValue - currentValue!
                index += 2
            }
            else
            {
                total += currentValue!
                index += 1
            }
        }
        
        return total
    }

}

