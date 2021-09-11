

func longestCommonPrefix(_ strs: [String]) -> String {
  
  if strs.count == 0 {return ""}
  if strs.count == 1 {return strs[0]}
  
  let strs = strs.sorted()
  
  var result = ""
  
  for i in 0..<strs[0].count
  {
    if Array(strs[0])[i] == Array(strs[strs.count-1])[i] {
      result += String(Array(strs[0])[i])
    } else { break }
  }
  
  return result
}


longestCommonPrefix(["flower","flow","flight"])
