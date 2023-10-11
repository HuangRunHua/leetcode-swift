import Foundation
/// **面试题 16.17. 连续数列**
/// 给定一个整数数组，找出总和最大的连续数列，并返回总和。
///
/// **示例**
/// 输入： [-2,1,-3,4,-1,2,1,-5,4]
/// 输出： 6
/// 解释： 连续子数组 [4,-1,2,1] 的和最大，为 6。
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        let N: Int = nums.count
        if N == 0 { return 0 }
        if N == 1 { return nums[0] }
        var dp: [Int] = Array(repeating: 0, count: N)
        dp[0] = nums[0]
        for i in 1..<N {
            dp[i] = max(nums[i], nums[i] + dp[i-1])
        }
        return dp.max()!
    }
}

let solution = Solution()
print(solution.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))
print(solution.maxSubArray([-2,-1]))
