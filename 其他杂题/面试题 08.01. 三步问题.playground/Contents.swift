import Foundation
/// **面试题 08.01. 三步问题**
/// 三步问题。有个小孩正在上楼梯，楼梯有n阶台阶，小孩一次可以上1阶、2阶或3阶。
/// 实现一种方法，计算小孩有多少种上楼梯的方式。结果可能很大，你需要对结果模1000000007。
///
/// **示例1**
/// 输入：n = 3
/// 输出：4
/// 说明: 有四种走法
class Solution {
    private let MOD: Int = 1_000_000_007
    func waysToStep(_ n: Int) -> Int {
        if n < 2 { return 1 }
        var (a, b, c) = (1,1,2)
        for _ in 2..<n {
            /// 原理
            /// 1 1 2  ----->  1 1 2 4
            /// a b c  ----->     a b c
            let temp: Int = c
            c = (a + b + c) % MOD
            a = b
            b = temp
        }
        return c
    }
}

let solution = Solution()
print(solution.waysToStep(3))   // 4
print(solution.waysToStep(5))   // 13
