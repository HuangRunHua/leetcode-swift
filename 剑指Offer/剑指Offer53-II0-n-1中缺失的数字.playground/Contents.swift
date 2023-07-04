import Foundation

class Solution {
    /// 执行用时: 92 ms, 在所有 Swift 提交中击败了 95.83% 的用户
    /// 内存消耗: 14.2 MB, 在所有 Swift 提交中击败了 16.67% 的用户
    /// 通过测试用例: 88 / 88
    func missingNumberSolution1(_ nums: [Int]) -> Int {
        var length: Int = nums.count - 1
        for i in 0...length {
            if nums[i] != i {
                return i
            }
        }
        return length + 1
    }
    
    func missingNumber(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        while (left <= right) {
            let mid = left + (right - left) >> 2
            if nums[mid] == mid {
                /// 说明在右边
                left = mid + 1
            } else {
                /// 说明在左边
                right = mid - 1
            }
        }
        return left
    }
}

let solution = Solution()
print(solution.missingNumber([0,1,3]))
print(solution.missingNumber([0,1,2,3,4,5,6,7,9]))
