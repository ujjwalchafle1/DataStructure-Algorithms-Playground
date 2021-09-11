//: [Previous](@previous)

import Foundation
import PlaygroundSupport

func recursiveRange(number : Int) -> Int
{
  if number == 0 { return 0 }
  return number + recursiveRange(number: number-1)
}
//recursiveRange(number: 4)

func product(arr: inout [Int]) -> Int
{
  var finalProduct = 1
  
  func currentProduct(num:Int)
  {
    print(num)
    finalProduct *= num
    if arr.isEmpty {return}
    currentProduct(num: arr.removeLast())
  }
  currentProduct(num: arr.removeLast())
  return finalProduct
}

var input = [1,2,3,4]

//product(arr: &input)

//: [Next](@next)


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
//reverse(-123)

//121 should retrun 121
//123 is not a palindrome
func isPalindrome(_ x: Int) -> Bool {
  
  if x < 0 { return false }
  
  var rev = 0
  var input = x
  
  while input != 0 {
    rev = rev * 10 + input % 10
    input = input / 10
  }
  
  if rev == x {
    return true
  }
  
  return false
}

//"III"
//"LVIII"
//"MMCMLXXXIX"
//"III"
//"IV"
//"IX"
//"LVIII"
//"MCMXCIV" // 1000 + (1000 - 100) + (100 - 10) + (5 - 1)
//3
//4
//9
//58
//1994
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
    
    if index + 1 <= s.count-1
    {
      let nextSymbol = String(Array(s)[index+1])
      nextValue = romanValues[nextSymbol]!
    }
    
    if currentValue! < nextValue
    {
      total += nextValue - currentValue!
      print(total)
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


//romanToInt("IV")


//func moveAllZeroLeft(arr: inout [Int]) -> [Int]?
//{
//  if arr.isEmpty {return nil}
//
//  var totalZeros = 0
//
//  for i in 0..<arr.count
//  {
//    if arr[i] != 0
//    {
//      arr[i] = arr[totalZeros]
//      totalZeros     += 1
//    }
//  }
//  return arr
//}
//var array = [5,2,0,10,0,0,7,3]
//moveAllZeroLeft(arr: &array)


func addBinary(a:String, b:String) -> String
{
  guard let _a = Int(a, radix: 2),
        let _b = Int(b, radix: 2) else { return "0" }
  
  return String(_a + _b, radix: 2)
}

//let result = addBinary(a:"11", b:"1")
//print(result)

func binaryAddition(_ a: String,_ b: String) -> String {
  
  var result = ""
  
  var indexA = Array(a).count-1
  var indexB = Array(b).count-1
  
  var carry = 0
  
  
  while indexA >= 0 || indexB >= 0
  {
    let bitA = indexA >= 0 ? Int(String(Array(a)[indexA]), radix: 2) : 0
    print(bitA!)
    let bitB = indexB >= 0 ? Int(String(Array(b)[indexB]), radix: 2) : 0
    print(bitB!)
    var sum = bitA! + bitB! + carry
    print("sum before = \(sum)")
    
    carry = sum/2
    print("carry = \(carry)")
    
    sum %= 2
    print("sum = \(sum)")
    
    result.insert("\(sum)".first!, at: result.startIndex)
    
    indexA -= 1
    indexB -= 1
  }
  if carry != 0
  {
    result.insert("\(carry)".first!, at: result.startIndex)
  }
  return result
}

binaryAddition("11", "11")


//merge two sorted arrays
//if there are repeated values in both arrays
//how to merge them?

func mergeSortedArray(nums1: inout [Int], m : Int, nums2: [Int], n : Int)
{
  var p1 = m - 1 //0
  var p2 = n - 1 //0
  
  var p = nums1.count - 1 //1
  
  while p > -1 {
    
    if p2 < 0 {
      break
    }
    
    if p1 > -1 && nums1[p1] > nums2[p2] {
      nums1[p] = nums1[p1]
      p1 -= 1
    } else {
      nums1[p] = nums2[p2]
      p2 -= 1
    }
    p -= 1
  }
}


//var a = [2,0], b = [1]
var a = [1,2,3,0,0,0] , b = [2,5,6]

//mergeSortedArray(nums1: &a, m: 1, nums2: b, n: 1)



//optimised solution
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int)
{
  var p1 = 0, p2 = 0
  var result = [Int]()
  
  while p1 < m || p2 < n {
    guard p1 != m else {
      result.append(contentsOf: nums2[p2..<n])
      break
    }
    guard p2 != n else {
      result.append(contentsOf: nums1[p1..<m])
      break
    }
    
    if nums1[p1] < nums2[p2] {
      result.append(nums1[p1])
      p1 += 1
    } else {
      result.append(nums2[p2])
      p2 += 1
    }
  }
  
  nums1 = result
}

//merge(&a,3,b,3)

var arr1 = [5,2,0,1,4,0,10,0]

func moveZerosToStart(arr: inout [Int]) -> [Int]
{
  var result:[Int] = []
  
  var indexOfZero = 0
  
  while indexOfZero<arr.count
  {
    if arr[indexOfZero] == 0 {
      result.append(0)
    }
    indexOfZero += 1
  }
  
  var indexOfNonZero = 0
  while indexOfNonZero<arr.count
  {
    if arr[indexOfNonZero] != 0 {
      result.append(arr[indexOfNonZero])
    }
    indexOfNonZero += 1
  }
  
  print(result)
  return result
}

//moveZerosToStart(arr: &arr1)


func moveZeroStart(arr: [Int]) -> [Int]
{
  var zeroArray:[Int] = []
  var nonZeroArray:[Int] = []
  
  for i in arr
  {
    if i != 0 {
      nonZeroArray.append(i)
    } else {
      zeroArray.append(0)
    }
  }
  
  return zeroArray+nonZeroArray
}

//moveZeroStart(arr:arr1)


var s1 = "A man, a plan, a canal: Panama"
var s2 = "race a car"

func removeSpecialCharsFromString(_ string:String) -> String{
  let validChar:Set<Character> = Set("abcdefghijklmnopqrstuvwxyz0123456789")
  return String(string.filter{validChar.contains($0)})
}

func palindrome(_ s: String) -> Bool
{
  print("before count - \(s.count)")
  let validString = removeSpecialCharsFromString(s.lowercased())
  print("after count - \(validString.count)")
  
  //  let validString = removeSpecialCharsFromString(s)
  let reversedStr = String(validString.reversed())
  
  if validString != reversedStr {
    return false
  }
  
  //  validString = validString.lowercased()
  //  var right = validString.count-1
  //  var left  = 0
  //
  //  while right >= left
  //  {
  //    //print(removeSpecialCharsFromString(text: s))
  //    if Array(validString)[left] == Array(validString)[right]
  //    {
  //      right -= 1
  //      left += 1
  //    }
  //    else {
  //      return false
  //    }
  //  }
  return true
}

//palindrome(s2)

/*
 Given a string s, return true if a permutation of the string could form a palindrome.
 
 Example 1:
 
 Input: s = "code"
 Output: false
 Example 2:
 
 Input: s = "aab"
 Output: true
 Example 3:
 
 Input: s = "carerac"
 Output: true
 
 
 Constraints:
 
 1 <= s.length <= 5000
 s consists of only lowercase English letters.
 */

//Logic : for even length of string each char will occur
func canPermutePalindrome(_ text: String) -> Bool {
  
  let s = removeSpecialCharsFromString(text.lowercased())
  var frequency: [String:Int] = [:]
  
  for i in Array(s)
  {
    if frequency[String(i)] != nil {
      frequency[String(i)]! += 1
    } else {
      frequency[String(i)] = 1
    }
  }
  
  var maxOddCount = 0
  
  for i in frequency.keys
  {
    if s.count % 2 != 0 {
      
      if frequency[String(i)]!%2 != 0 {
        maxOddCount += 1
      }
      if maxOddCount > 1 {
        return false
      }
    }
    else
    {
      if frequency[String(i)]!%2 != 0 {
        return false
      }
    }
  }
  return true
}


//canPermutePalindrome(str)
func getPower(_ exponent: Int) -> Int
{
  if exponent <= 0 {return 1}
  var power = 10
  if exponent == 1 {return power}
  power *= getPower(exponent-1)
  return power
}

getPower(0)


func addStrings(_ num1: String, _ num2: String) -> String
{
  let values = ["0":0, "1":1, "2":2, "3":3, "4":4, "5":5, "6":6, "7":7, "8":8, "9":9]
  
  var p1 = num1.count-1
  var p2 = num2.count-1
  
  var carry   = 0
  var result  = ""
  
  while p1 >= 0 || p2 >= 0
  {
    let lastDigit1 = p1 >= 0 ? values[String(Array(num1)[p1])] : 0
    let lastDigit2 = p2 >= 0 ? values[String(Array(num2)[p2])] : 0
    //
    var value = (lastDigit1! + lastDigit2! + carry) % 10
    carry     = (lastDigit1! + lastDigit2! + carry) / 10
    result    += "\(value)"
    p1 -= 1
    p2 -= 1
  }
  
  if carry != 0 {
    result    += "\(carry)"
  }
  
  return result
}
//addStrings("307", "303")

//addStrings("3876620623801494171", "6529364523802684779")


//public String addStrings(String num1, String num2) {
//        StringBuilder res = new StringBuilder();
//
//        int carry = 0;
//        int p1 = num1.length() - 1;
//        int p2 = num2.length() - 1;
//        while (p1 >= 0 || p2 >= 0) {
//            int x1 = p1 >= 0 ? num1.charAt(p1) - '0' : 0;
//            int x2 = p2 >= 0 ? num2.charAt(p2) - '0' : 0;
//            int value = (x1 + x2 + carry) % 10;
//            carry = (x1 + x2 + carry) / 10;
//            res.append(value);
//            p1--;
//            p2--;
//        }
//
//        if (carry != 0)
//            res.append(carry);
//
//        return res.reverse().toString();
//    }


func validPalindrome(_ s: String) -> Bool
{
  var start = 0
  var end   = s.count-1
  
  while start < end
  {
    if Array(s)[start] == Array(s)[end]
    {
      start += 1
      end   -= 1
    }
    else
    {
      if (isPalindrome(s, start+1, end)) {
        return true
      }
      
      if (isPalindrome(s, start, end-1)) {
        return true
      }
      return false
    }
  }
  return true
}

func isPalindrome(_ s: String,_ start: Int,_ end: Int) -> Bool
{
  var start = start
  var end   = end
  
  while start < end
  {
    if Array(s)[start] != Array(s)[end] {
      return false
    }
    start += 1
    end   -= 1
  }
  return true
}

//validPalindrome("fgzkopbggtmurmcixeimxjweprviisfbkjdiunkqbkvtodinhararcvebekuvjnytfpqzhctpkrfivhbhjejkdaihgndwoidvxvkjahwdwwvdjnxtsnlkpgipbpbrqyiwcluvzywdlupiqjkfsotycjbsnrigfjcutzelqztkokfrrchsnulntfgmsrdugoiocawsvahydvwduadlbjomwislgphrogoavdkehniahlfetwivwlrdgquaxacftgcneuoithswznxsltbyihttmkmtxbrabtotfprbpeffizrpkmkylcjnabhrextpcypduyuksrsomfixnrofrddbzolcwxakufjdayzaonmaviuphhmtpbaeitxaspmmgvabxmtdqiwvagfydcvyrpfhljwztrwqlsrxvewybvpssqncwlpknnsubsvmlmwsocqcveruzvamxsbhpbzhysbqamhaqrksabujqawrrsxmznijnuexzxghkvglrfmwhfheusbkbiqlekdglltplrxjdpvnbuxujgqkckanddkcjwscsekappdfhukizanuibsyzjpqgcouukvgwitlbbkeghqthjdyvizotcchneixucreqwougzmcirpqgwhwztjypdwvlahtlmecjrvnybwdhqjznjkajmwyilidybszcqzuymhfvpfxlcbgvslltkceqsblkmlniiqxxjkttaiigrbzebtqptcrvrzkalgumjnnnrmzonpjavxgupqxvznnfncjavobacktxrkaftdklghciyshjnlnrfjazgsuuahuakqngccfwabgahkjycvgqpjbluaviusqwhsvfehugbsfvfjjkvwxeytqnxfsbwatfdzrbbsndppmmjsdenwbnikuvarvkavszlisqcoxtxbfomtwmozjguufubhmpxuxxedgsaoccdbnmruligziypxuaiflhunnzqouwswznmxqvcvjzfazfwogyjeyyejygowfzafzjvcvqxmnzwswuoqznnuhlfiauxpyizgilurmnbdccoasgdexxuxpmhbufuugjzomwtmofbxtxocqsilzsvakvravukinbwnedsjmmppdnsbbrzdftawbsfxnqtyexwvkjjfvfsbguhefvshwqsuivaulbjpqgvcyjkhagbawfccgnqkauhauusgzajfrnlnjhsyichglkdtfakrxtkcabovajcnfnnzvxqpugxvajpnozmrnnnjmuglakzrvrctpqtbezbrgiiattkjxxqiinlmklbsqecktllsvgbclxfpvfhmyuzqczsbydiliywmjakjnzjqhdwbynvrjcemlthalvwdpyjtzwhwgqpricmzguowqercuxienhcctozivydjhtqhgekbbltiwgvkuuocgqpjzysbiunazikuhfdppakescswjckddnakckqgjuxubnvpdjxrlptllgdkelqibkbsuehfhwmfrlgvkhgxzxeunjinzmxsrrwaqjubaskrqahmaqbsyhzbphbsxmavzurevcqcoswmlmvsbusnnkplwcnqsspvbywevxrslqwrtzwjlhfpryvcdyfgavwiqdtmxbavgmmpsaxtieabptmhhpuivamnoazyadjfukaxwclozbddrfornxifmosrskuyudpycptxerhbanjclykmkprziffepbrpftotbarbxtmkmtthiybtlsxnzwshtiouencgtfcaxauqgdrlwviwteflhainhekdvaogorhpglsiwmojbldaudwvdyhavswacoiogudrsmgftnlunshcrrfkoktzqleztucjfgirnsbjcytosfkjqipuldwyzvulcwiyqrbpbpigpklnstxnjdvwwdwhajkvxvdiowdnghiadkjejhbhvifrkptchzqpftynjvukebevcrarahnidotvkbqknuidjkbfsiivrpewjxmiexicmrumtggbpokzg")

//validPalindrome("abcba")


func firstBadVersion(_ n: Int) -> Int
{
  var left    = 1
  var right   = n
  
  while left < right
  {
    let mid = (left+right)/2
    if isBadVersion(mid) {
      right = mid
    }
    else {
      left = mid + 1
    }
  }
  return left
}

func isBadVersion(_ value: Int) ->Bool {
  return value >= 3 ? true : false
}

//firstBadVersion(7)
//123456


func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
  
  var intAtK = k
  
  if intAtK <= arr[0]-1 {
    return intAtK
  }
  
  intAtK -= arr[0] - 1
  var index = 0
  while index < arr.count-1
  {
    var currentMissing = arr[index+1] - arr[index] - 1
    
    if intAtK <= currentMissing {
      return arr[index] + intAtK
    } else {
      intAtK -= currentMissing
    }
    
    index += 1
  }
  
  return arr.last! + intAtK
}


func maxProfit(_ prices: [Int]) -> Int {
  
  var minPriceIndex = Int.max
  var maxProfit = 0
  
  
  for i in 0..<prices.count
  {
    if prices[i] < minPriceIndex
    {
      minPriceIndex = prices[i]
    } else if prices[i] - minPriceIndex > maxProfit
    {
      //      print(prices[i])
      //      print(minPriceIndex > maxProfit)
      //      print(prices[i] - minPriceIndex > maxProfit)
      maxProfit = prices[i] - minPriceIndex
    }
  }
  
  return maxProfit
}

maxProfit([2,4,1])


//class Solution {
func minRemoveToMakeValid(_ s: String) -> String {
  
  let s1 = Array(s)
  
  var stack:[Int] = []
  var indexToRemove:[Int] = []
  
  
  for i in 0..<s1.count
  {
    if s1[i] == "("{
      stack.append(i)
    }
    else if s1[i] == ")"
    {
      if stack.isEmpty{
        indexToRemove.append(i)
      } else {
        stack.popLast()
      }
    }
  }
  print(indexToRemove)
  while !stack.isEmpty {
    indexToRemove.append(stack.popLast()!)
  }
  print(indexToRemove)
  
  var result = ""

  for i in 0..<s1.count{
   // print(i)
          print("String(i) - \(String(i))")

    if !indexToRemove.contains(i) {
     // print(result)
//      print(String(i))

      result = result + String(s1[i])
      print("result - \(result)")
    }
  }
  
//  var left = 0
//  var right = s1.count-1
//  var removeIndices:[Int] = []
//  while left <= right
//  {
//    if s1[left] != "("
//    {
//      if  s1[left] == ")"{
//        removeIndices.append(left)
//      }
//      left += 1
//    }
//    else if s1[right] != ")"
//    {
//      if  s1[right] == "("{
//        removeIndices.append(right)
//      }
//      right -= 1
//    }
//    else {
//      left += 1
//      right -= 1
//    }
//
//   // print(String(s1))
//  }
//  print(removeIndices)
//  for i in 0..<s1.count{
//    if !removeIndices.contains(i) {
//      result += String(s1[i])
//    }
//  }
  
  return result
  
}

print(minRemoveToMakeValid("())()((("))



var visitTracker:[String:Int] = [:]
    func subdomainVisits(_ cpdomains: [String]) -> [String]
    {
        var result:[String] = []
        for i in 0..<cpdomains.count
        {
            var domainArray = cpdomains[i].components(separatedBy: " ")
            trackVisits(domainArray.last!, Int(domainArray.first!)!)
        }
        
        for key in visitTracker.keys
        {
            result.append("\(visitTracker[key]!) \(key)")
        }
        
        return result
    }
    
    func trackVisits(_ domain: String,_ visit: Int)
    {
        var tempDomain = domain
            if visitTracker[tempDomain] != nil{
                visitTracker[tempDomain]! += visit
            } else {
                visitTracker[tempDomain] = visit
            }
        
        if tempDomain.components(separatedBy:".").count > 0{
            var subDomainArr = tempDomain.components(separatedBy:".")
          print(subDomainArr)
            subDomainArr.removeFirst()
          print(subDomainArr)
          var subDomain = ""
          if subDomainArr.count > 1 {
            subDomain = subDomainArr.joined(separator: ".")
            trackVisits(subDomain, visit)
          } else if subDomainArr.count == 1{
            subDomain = subDomainArr[0]
            trackVisits(subDomain, visit)
            return
          }
//            var subDomain = subDomainArr.joined(separator: ".")
            
        }
    }

subdomainVisits(["900 google.mail.com", "50 yahoo.com", "1 intel.mail.com", "5 wiki.org"])



print(5-6)
var ans = [Int](repeating: 3, count: 64)


func inArray(_ a1: [String], _ a2: [String]) -> [String] {
    // your code
  
  var output = [String]()
  for text1 in a1 {
    for text2 in a2 {
      if text2.contains(text1) {
        output.append(text1)
        break
      }
    }
  }
  return output
}

inArray(["tarp", "mice", "bull"], ["lively", "alive", "harp", "sharp", "armstrong"])


func playPass(_ s: String, _ n: Int) -> String {
  
  var outputPhrase: String = ""
  let alphabetDict = ["A": 1, "B": 2, "C": 3, "D": 4, "E": 5]
  // your code
  let phrase = Array(s)
  
  for letter in phrase {
//    print(Int(String(letter)))

    if Int(String(letter)) == nil {
      let position = alphabetDict[String(letter)]
      print("fjbfabfgkbg \(position!)")
      var shiftedIndex = position! + 1
      if shiftedIndex < alphabetDict.count {
        print(Array(alphabetDict)[shiftedIndex].key)
        outputPhrase.append(Array(alphabetDict)[shiftedIndex].key)
      }
    }
  }
  
  return outputPhrase
}

playPass("ABCD", 1)
