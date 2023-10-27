import Foundation
/// **213. 打家劫舍 II**
/// 你是一个专业的小偷，计划偷窃沿街的房屋，每间房内都藏有一定的现金。
/// 这个地方所有的房屋都 围成一圈 ，这意味着第一个房屋和最后一个房屋是紧挨着的。
/// 同时，相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，
/// 系统会自动报警 。
/// 给定一个代表每个房屋存放金额的非负整数数组，计算你在不触动警报装置的情况下
/// 今晚能够偷窃到的最高金额。
///
/// **示例 1**
/// 输入：nums = [2,3,2]
/// 输出：3
/// 解释：你不能先偷窃 1 号房屋（金额 = 2），然后偷窃 3 号房屋（金额 = 2）, 因为他们是相邻的。
class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 1 { return nums[0] }
        /// 解题思路:
        ///     - 由于房屋是相邻的，因此可以将计算分为两个部分
        ///         1. 当从第一个房屋开始偷的时候不考虑最后一个房屋
        ///         2. 当不从第一个房屋开始偷的时候可以考虑最后一个房屋
        ///     - 上述两种情况求最大值即可得到最终的结果
        let nums1 = Array(nums.dropFirst())
        let nums2 = Array(nums.dropLast())
        return max(maxValue(nums1), maxValue(nums2))
    }
    
    /// 打家劫舍I中的动态规划
    func maxValue(_ nums: [Int]) -> Int {
        let N = nums.count
        /// dp的含义
        ///     - dp[i]表示偷到第i个房屋可以偷窃到的最高金额
        ///     - dp[1] = nums[0], dp[2] = nums[1]
        ///     - dp[i] = MAX(dp[i-2]+nums[i-1], dp[i-1])
        var dp: [Int] = Array(repeating: 0, count: N + 1)
        for i in 1...N {
            if i == 1 { dp[i] = nums[i-1] }
            else {
                dp[i] = max(dp[i-2] + nums[i-1], dp[i-1])
            }
        }
        return dp[N]
    }
}

let solution = Solution()
print(solution.rob([1,2,3,1]))      // 4
print(solution.rob([2,3,2]))        // 3
