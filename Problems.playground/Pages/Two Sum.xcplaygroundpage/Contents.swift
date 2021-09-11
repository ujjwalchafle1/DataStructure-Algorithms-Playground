    func twoSum(_ nums: [Int], _ target: Int) -> [Int]
    {
      var sortedArr = nums.sorted()
      var left    = 0
      var right   = nums.count-1
      
      for i in 0..<nums.count
      {
        var sum = sortedArr[left] + sortedArr[right]
        
        if sum == target
        {
          var indicies:[Int] = []
          indicies = nums.filter({ number in
            return number == sortedArr[left] || nums[i] == sortedArr[right]
          })
          for i in 0..<nums.count {
            if nums[i] == sortedArr[left] || nums[i] == sortedArr[right] && indicies.count < 2 {
              indicies.append(i)
            }
          }
          return indicies
        }
        
        if sum > target {
          right -= 1
        } else if sum < target {
          left += 1
        }
      }
      
      return [0,0]
    }
    
twoSum([2,7,11,15], 9)
