import Foundation
/// **53. 最大子数组和**
/// 给你一个整数数组 nums ，请你找出一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
/// **子数组**是数组中的一个连续部分。
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        let N = nums.count
        var dp: [Int] = Array(repeating: 0, count: N)
        dp[0] = nums[0]
        for i in 1..<N {
            dp[i] = max(dp[i-1] + nums[i], nums[i])
        }
        return dp.max()!
    }
}

let solution = Solution()
print(solution.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))   // 6
print(solution.maxSubArray([5,4,-1,7,8]))   // 23
