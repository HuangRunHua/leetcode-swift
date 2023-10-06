import Foundation
/// **1137. 第 N 个泰波那契数**
/// 泰波那契序列 Tn 定义如下：
/// T0 = 0, T1 = 1, T2 = 1, 且在 n >= 0 的条件下 Tn+3 = Tn + Tn+1 + Tn+2
/// 给你整数 n，请返回第 n 个泰波那契数 Tn 的值。
class Solution {
    func tribonacciSolution1(_ n: Int) -> Int {
        if n < 2 { return n }
        if n == 2 { return n - 1 }
        var dp: [Int] = Array(repeating: 0, count: n + 1)
        dp[0] = 0
        dp[1] = 1
        dp[2] = 1
        for i in 3...n {
            dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
        }
        return dp[n]
    }
    
    func tribonacci(_ n: Int) -> Int {
        if n < 2 { return n }
        if n == 2 { return n - 1 }
        var (a, b, c) = (1, 1, 0)
        for _ in 3...n {
            let tmp: Int = a
            a = a + b + c
            c = b
            b = tmp
        }
        return a
    }
}

let solution = Solution()
print(solution.tribonacci(4))
print(solution.tribonacci(25))

