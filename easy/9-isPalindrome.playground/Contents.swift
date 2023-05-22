import Foundation

class Solution {
    // total: 44 ms
    func isPalindromeSolution1(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        if (x >= 0) && (x < 10) {
            return true
        }
        
        let x_string: String = String(x)
        let x_string_reverse: String = String(x_string.reversed())
        var id = 0
        for (c1, c2) in zip(x_string, x_string_reverse) {
            if id <= Int(x_string.count/2) {
                if c1 != c2 {
                    return false
                }
            }
        }
        
        return true
    }
    
    // total: 32 ms
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        if (x >= 0) && (x < 10) {
            return true
        }
        var nums: [Int] = []
        var ori = x
        while ori != 0 {
            let result = ori % 10
            ori /= 10
            nums.append(result)
        }
        for (id, num) in zip(0..<nums.count, nums) {
            if num != nums[nums.count-id-1] {
                return false
            }
        }
        return true
    }
}

let solution = Solution()
print(solution.isPalindrome(121))
print(solution.isPalindrome(-121))
print(solution.isPalindrome(10))
print(solution.isPalindrome(1000000001))
