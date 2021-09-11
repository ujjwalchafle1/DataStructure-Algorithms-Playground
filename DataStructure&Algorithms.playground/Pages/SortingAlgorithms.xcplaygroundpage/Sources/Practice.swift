//bubble sort
func bubbleSort(_ arr: [Int]) -> [Int]{
  var outputArr = arr
  
  for _ in outputArr
  {
    var isSwapped = false
    for i in 1..<outputArr.count {
      if outputArr[i - 1] > outputArr[i] {
        let greaterValue = outputArr[i - 1]
        outputArr[i - 1] = outputArr[i]
        outputArr[i]     = greaterValue
        isSwapped = true
      }
    }
    if !isSwapped {break}
  }
  
  return outputArr
}

//print(bubbleSort([6,5,4,0,1,9]))

//selection sort
func selectionSort(_ arr: [Int]) -> [Int]
{
  var sortedArr = arr
  
  for i in 0..<sortedArr.count {
    var minValIndex = i
    for j in i+1..<sortedArr.count {
      if sortedArr[minValIndex] > sortedArr[j]{
        minValIndex = j
      }
    }
    let swapValue = sortedArr[i]
    sortedArr[i] = sortedArr[minValIndex]
    sortedArr[minValIndex]  = swapValue
  }
  
  return sortedArr
}

//print(selectionSort([6,5,4,0,1,9]))
//insertion sort
func insertionSort(_ arr: [Int]) -> [Int]{
  var sortedArr = arr
  
  for i in 1..<sortedArr.count {
    var position = i
    
    while position > 0 && sortedArr[position - 1] > sortedArr[position] {
      let swapValue = sortedArr[position - 1]
      sortedArr[position - 1] = sortedArr[position]
      sortedArr[position] = swapValue
      position -= 1
    }
  }
  
  return sortedArr
}

//print(insertionSort([6,5,4,0,1,9]))
