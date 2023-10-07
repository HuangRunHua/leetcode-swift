import Foundation
/// **338. 比特位计数**
// MARK: 解法一
/// 传统的暴力破解法
class Solution1 {
    func countBits(_ n: Int) -> [Int] {
        var result: [Int] = []
        for i in 0...n {
            result.append(_countBits(i))
        }
        return result
    }
    /// 计算num中1的个数
    func _countBits(_ num: Int) -> Int {
        var _num = num
        var result: Int = 0
        while _num > 0 {
            result += (_num % 2)
            _num >>= 1
        }
        return result
    }
}
// MARK: 解法2
/// 寻找重复数字的解法
class Solution2 {
    func countBits(_ num: Int) -> [Int] {
        if num == 0 { return [0] }
        let N = num
        var dp: [Int] = Array(repeating: 0, count: N+1)
        /// 计算2的次幂
        var multiply: Int = 1
        for i in 1...N {
            /// 通过观察规律可以得到，0～3 是两位，分别是00，01，10，11
            /// 然后 4 到 7 是三位，分别是100，101，110，111，这不就是前面多了个 1
            /// 每遇到2的次幂的时候dp[i] = 1, 如2: 10， 4: 100
            if multiply * 2 == i {
                dp[i] = 1
                multiply *= 2
            } else {
                dp[i] = 1 + dp[i - multiply]
            }
        }
        return dp
    }
}
// MARK: 最优解法
/// 根据奇偶来判定1的个数
class Solution {
    func countBits(_ num: Int) -> [Int] {
        if num == 0 { return [0] }
        let N = num
        var dp: [Int] = Array(repeating: 0, count: N + 1)
        for i in 1...N {
            /// 如果当前是奇数，则1的个数为前面一位偶数中1的个数+1
            /// 如果当前是偶数，则1的个数为折半后元素中1的个数
            if i & 1 == 1 { dp[i] = dp[i-1] + 1 }
            else { dp[i] = dp[i/2] }
        }
        return dp
    }
}

let solution = Solution()
print(solution.countBits(5))
print(solution.countBits(0))
