import Foundation
/// **313. 超级丑数**
/// 超级丑数是一个正整数，并满足其所有质因数都出现在质数数组 primes 中。
/// 给你一个整数 n 和一个整数数组 primes ，返回第 n 个 超级丑数 。
/// 题目数据保证第 n 个 超级丑数 在 32-bit 带符号整数范围内。
///
/// **示例 1**
/// 输入：n = 12, primes = [2,7,13,19]
/// 输出：32
/// 解释：给定长度为 4 的质数数组 primes = [2,7,13,19]
/// 前 12 个超级丑数序列为：[1,2,4,7,8,13,14,16,19,26,28,32] 。
class Solution {
    func nthSuperUglyNumber(_ n: Int, _ primes: [Int]) -> Int {
        /// **dp的含义**
        ///     - dp[i]表示第i+1个超级丑数
        ///     - dp[0] = 1
        /// **dp的递推公式**
        ///     - dp[i] = min(dp[a]primes[0], dp[b]primes[1], ....)
        var dp: [Int] = Array(repeating: 1, count: n)
        /// counter用于指向dp数组，表示primers中的每一个元素经过乘法后运算到当前的某一位
        var counter: [Int] = Array(repeating: 0, count: primes.count)
        for i in 1..<n {
            /// 存储下一轮候选数字
            var referenceArray: [Int] = []
            for (j, index) in zip(counter, 0..<primes.count) {
                referenceArray.append(dp[j]*primes[index])
            }
            /// 更新下一个超级丑数
            dp[i] = referenceArray.min()!
            /// 更新指针，如果当前的某一位数字被使用了则更新索引
            for id in 0..<referenceArray.count {
                if dp[i] == referenceArray[id] {
                    counter[id] += 1
                }
            }
        }
        return dp[n-1]
    }
}

let solution = Solution()
print(solution.nthSuperUglyNumber(12, [2,7,13,19]))      // 32
print(solution.nthSuperUglyNumber(1, [2,3,5]))           // 1

