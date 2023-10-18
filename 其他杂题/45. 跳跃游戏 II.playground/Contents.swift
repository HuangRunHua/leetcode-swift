import Foundation
/// **45. 跳跃游戏 II**
/// 给定一个长度为 n 的 0 索引整数数组 nums。初始位置为 nums[0]。
/// 每个元素 nums[i] 表示从索引 i 向前跳转的最大长度。换句话说，如果你在 nums[i] 处，你可以跳转到任意 nums[i + j] 处:
///     1. 0 <= j <= nums[i]
///     2. i + j < n
/// 返回到达 nums[n - 1] 的最小跳跃次数。生成的测试用例可以到达 nums[n - 1]。
///
/// **示例 1**
/// 输入: nums = [2,3,1,1,4]
/// 输出: 2
/// 解释: 跳到最后一个位置的最小跳跃数是 2。从下标为 0 跳到下标为 1 的位置，跳 1 步，然后跳 3 步到达数组的最后一个位置。
class Solution {
    func jump(_ nums: [Int]) -> Int {
        let N: Int = nums.count
        if N == 1 { return 0 }
        /// dp的含义:
        ///     - dp[i]表示到达第i-1个位置所需要的最小跳跃次数
        ///     - 由于题目从第一个位置开始跳跃，因此dp[0] = 0, dp[1] = 0
        ///     - dp[i] = min(dp[i-1] + 1, dp[i-2] + 1, ..., dp[1] + 1) 当nums[i-2] > 0, nums[i-3] > 1,....
        var dp: [Int] = Array(repeating: Int.max, count: N + 1)
        dp[0] = 0
        dp[1] = 0
        for i in 2...N {
            for j in 1..<i {
                if nums[j-1] >= (i - j) {
                    dp[i] = min(dp[i], dp[j] + 1)
                }
            }
        }
        return dp[N]
    }
}

let solution = Solution()
print(solution.jump([2,3,1,1,4]))   // 2
print(solution.jump([2,3,0,1,4]))   // 2
