import Foundation
/// **198. 打家劫舍**
/// 你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，
/// 影响你偷窃的唯一制约因素就是相邻的房屋装有相互连通的防盗系统，
/// 如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。
/// 给定一个代表每个房屋存放金额的非负整数数组，计算你 不触动警报装置的情况下 ，一夜之内能够偷窃到的最高金额。
///
/// **示例 1**
/// 输入：[1,2,3,1]
/// 输出：4
/// 解释：偷窃 1 号房屋 (金额 = 1) ，然后偷窃 3 号房屋 (金额 = 3)。
///     偷窃到的最高金额 = 1 + 3 = 4 。
class Solution {
    func rob(_ nums: [Int]) -> Int {
        let N = nums.count
        /// dp的含义
        ///     - dp[i]表示偷到第i个房屋可以偷窃到的最高金额
        ///     - dp[1] = nums[0], dp[2] = nums[1]
        ///     - dp[i] = MAX(dp[i-2] + nums[i-1], dp[i-1])
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
print(solution.rob([2,7,9,3,1]))    // 12
