


func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
  
  var p1 = 0, p2 = 0
  
  var result:[Int] = []
  
  while p1 < m || p2 < n
  {
    guard p1 != m else {
      result.append(contentsOf: nums2[p2..<n])
      break
    }
    
    guard p2 != n else {
      result.append(contentsOf: nums1[p1..<m])
      break
    }
    
    if nums1[p1] < nums2[p2]
    {
      result.append(nums1[p1])
      p1 += 1
    } else {
      result.append(nums2[p2])
      p2 += 1
    }
  }
  
  nums1 = result
}
var nums1 = [1,2,3,0,0,0]
merge(&nums1, 4, [2,5,6], 3)
