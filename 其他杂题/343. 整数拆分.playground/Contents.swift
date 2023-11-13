import Foundation
/// **343. 整数拆分**
/// 给定一个正整数 n ，将其拆分为 k 个 正整数 的和（ k >= 2 ），并使这些整数的乘积最大化。
/// 返回 你可以获得的最大乘积 。
///
/// **示例 2**
/// 输入: n = 10
/// 输出: 36
/// 解释: 10 = 3 + 3 + 4, 3 × 3 × 4 = 36。
class Solution {
    func integerBreak(_ n: Int) -> Int {
        /// **dp的含义**
        ///     - `dp[i]`表示拆分第i个正整数后的乘积最大值
        ///     - `dp[0] = 0`且`dp[1] = 0`因为这两个数无法拆分
        ///     - **递推公式需要考虑是否将前面的元素拆封**
        ///         - 当`i`拆分为`j`与`i-j`且`j`继续被拆分的时候有`dp[i] = max(dp[0]*i, dp[1]*(i-1), ..., dp[i-1])`
        ///         - 当`i`拆分为`j`与`i-j`且`j`不被拆分的时候有`dp[i] = max(0*i, 1*(i-1), ..., (i-1)*1)`
        var dp: [Int] = Array(repeating: 0, count: n + 1)
        for i in 1...n {
            for j in 0..<i {
                dp[i] = max(dp[i], j*(i-j), dp[j]*(i-j))
            }
        }
        return dp[n]
    }
}

let solution = Solution()
print(solution.integerBreak(10))    // 36
print(solution.integerBreak(2))     // 1
print(solution.integerBreak(3))     // 2

