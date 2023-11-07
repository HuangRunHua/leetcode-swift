import Foundation
/// **264. 丑数 II**
/// 给你一个整数 n ，请你找出并返回第 n 个 丑数 。
/// 丑数就是质因子只包含 2、3 和 5 的正整数。
///
/// **示例 1**
/// 输入：n = 10
/// 输出：12
/// 解释：[1, 2, 3, 4, 5, 6, 8, 9, 10, 12] 是由前 10 个丑数组成的序列。
class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        var (a, b, c) = (0, 0, 0)
        var dp: [Int] = [1]
        for _ in 1..<n {
            let newNum = min(dp[a]*2, dp[b]*3, dp[c]*5)
            if newNum == dp[a]*2 { a += 1 }
            if newNum == dp[b]*3 { b += 1 }
            if newNum == dp[c]*5 { c += 1 }
            dp.append(newNum)
        }
        return dp[n-1]
    }
}

let solution = Solution()
print(solution.nthUglyNumber(10))
print(solution.nthUglyNumber(1))
