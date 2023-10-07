import Foundation
/// **1646. 获取生成数组中的最大值**
/// 给你一个整数 n 。按下述规则生成一个长度为 n + 1 的数组 nums ：
///     - nums[0] = 0
///     - nums[1] = 1
///     - 当 n >= 2 * i >= 2 时，nums[2 * i] = nums[i]
///     - 当 n >= 2 * i + 1 >= 2 时，nums[2 * i + 1] = nums[i] + nums[i + 1]
/// 返回生成数组 nums 中的最大值。
class Solution {
    func getMaximumGenerated(_ n: Int) -> Int {
        if n < 2 { return n }
        var dp:[Int] = Array(repeating: 0, count: n+1)
        dp[1] = 1
        for i in 2...n {
            if i % 2 == 0 { dp[i] = dp[i/2] }
            else { dp[i] = dp[(i-1)/2] + dp[(i+1)/2] }
        }
        return dp.max()!
    }
}

let solution = Solution()
print(solution.getMaximumGenerated(7))  // 3
print(solution.getMaximumGenerated(2))  // 1
print(solution.getMaximumGenerated(3))  // 2

