import Foundation
/// **55. 跳跃游戏**
/// 给你一个非负整数数组 nums ，你最初位于数组的**第一个下标**。数组中的每个元素代表你在该位置可以跳跃的最大长度。
/// 判断你是否能够到达最后一个下标，如果可以，返回 true ；否则，返回 false 。
/// **示例 1**
/// 输入：nums = [2,3,1,1,4]
/// 输出：true
/// 解释：可以先跳 1 步，从下标 0 到达下标 1, 然后再从下标 1 跳 3 步到达最后一个下标。
///
// MARK: 动态规划解法
class Solution1 {
    func canJump(_ nums: [Int]) -> Bool {
        let N: Int = nums.count
        if N == 1 { return true }
        /// dp的含义：
        ///     - dp[i]表示是否可以到达第i-1个位置
        ///     - 根据题意从下标0开始所以必然有 dp[0] = dp[1] = true
        ///     - dp[i] = (dp[i-1] && nums[i-2] > 0) || (dp[i-2] && nums[i-3] > 0) || ... || (dp[1] && nums[0] > i)
        var dp: [Bool] = Array(repeating: false, count: N + 1)
        dp[0] = true
        dp[1] = true
        for i in 2...N {
            for j in 1..<i {
                if dp[j] && nums[j-1] >= (i - j) {
                    dp[i] = true
                    break
                }
            }
        }
        return dp[N]
    }
}

// MARK: 贪心思路
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        let N = nums.count
        /// 最远可以到达的距离
        var maxLength: Int = 0
        for i in 0..<N {
            /// 当当前位置小于等于最远可以到达的位置说明当前的位置可以到达
            if i <= maxLength {
                /// 更新最远可以到达的位置
                maxLength = max(i + nums[i], maxLength)
                /// 如果最远可以到达的位置已经超过或等于数组的长度说明可以到达末尾，直接返回true
                if maxLength >= (N - 1) { return true }
            }
        }
        return false
    }
}

let solution = Solution()
print(solution.canJump([2,3,1,1,4]))
print(solution.canJump([3,2,1,0,4]))
