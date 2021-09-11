





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
