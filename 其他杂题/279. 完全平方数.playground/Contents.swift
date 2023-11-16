import Foundation
/// **279. 完全平方数**
/// 给你一个整数 n ，返回和为 n 的完全平方数的最少数量 。
/// 完全平方数是一个整数，其值等于另一个整数的平方；
/// 换句话说，其值等于一个整数自乘的积。
/// 例如，1、4、9 和 16 都是完全平方数，而 3 和 11 不是。
///
/// **示例 1**
/// 输入：n = 12
/// 输出：3
/// 解释：12 = 4 + 4 + 4
///

// MARK: 暴力超时算法
class Solution1 {
    static var perfectSquareNumbers: Set<Int> {
        return Solution1.generatePerfectSquareNumber()
    }
    func numSquares(_ n: Int) -> Int {
        /// **dp的意义**
        ///     - `dp[i]`表示和为`i`的完全平方数的最少数量。
        ///     - `dp[0] = 0`且`dp[1] = 1`
        ///     - 当`j-i`为完全平方数则有`dp[i] = min(dp[j]) + 1`
        var dp: [Int] = Array(repeating: Int.max, count: n + 1)
        dp[0] = 0
        dp[1] = 1
        if n == 1 { return 1 }
        for i in 2...n {
            for j in 0..<i {
                if Solution1.perfectSquareNumbers.contains(i-j) {
                    dp[i] = min(dp[j] + 1, dp[i])
                }
            }
        }
        return dp[n]
    }
    
    static func generatePerfectSquareNumber() -> Set<Int> {
        var perfectSquareNumbers: Set<Int> = []
        for i in 0...100 {
            perfectSquareNumbers.insert(i*i)
        }
        return perfectSquareNumbers
    }
}

// MARK: 优化后的算法
class Solution {
    func numSquares(_ n: Int) -> Int {
        /// **dp的意义**
        ///     - `dp[i]`表示和为`i`的完全平方数的最少数量。
        ///     - `dp[0] = 0`且`dp[1] = 1`
        ///     - 当`j-i`为完全平方数则有`dp[i] = min(dp[j]) + 1`
        var dp: [Int] = Array(repeating: Int.max, count: n + 1)
        dp[0] = 0
        dp[1] = 1
        if n == 1 { return 1 }
        for i in 2...n {
            var id = 1
            while id*id <= i {
                dp[i] = min(dp[i-id*id] + 1, dp[i])
                id += 1
            }
        }
        return dp[n]
    }
}

let solution = Solution()
print(solution.numSquares(12))          // 3
print(solution.numSquares(13))          // 2
