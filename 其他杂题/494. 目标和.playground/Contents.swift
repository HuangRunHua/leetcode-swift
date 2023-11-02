import Foundation
/// **494. 目标和**
/// 给你一个非负整数数组 nums 和一个整数 target 。
/// 向数组中的每个整数前添加 '+' 或 '-' ，然后串联起所有整数，可以构造一个 表达式 ：
/// 例如，nums = [2, 1] ，可以在 2 之前添加 '+' ，在 1 之前添加 '-' ，然后串联起来得到表达式 "+2-1" 。
/// 返回可以通过上述方法构造的、运算结果等于 target 的不同表达式的数目。
///
/// **示例 1**
/// 输入：nums = [1,1,1,1,1], target = 3
/// 输出：5
/// 解释：一共有 5 种方法让最终目标和为 3 。
/// -1 + 1 + 1 + 1 + 1 = 3
/// +1 - 1 + 1 + 1 + 1 = 3
/// +1 + 1 - 1 + 1 + 1 = 3
/// +1 + 1 + 1 - 1 + 1 = 3
/// +1 + 1 + 1 + 1 - 1 = 3
class Solution1 {
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        let N: Int = nums.count
        /// **三维dp**
        ///     - dp[i][0]表示当第i-1个数字的符号为-的时候前 i-1 个数字之和的列表
        ///     - dp[i][1]表示当第i-1个数字的符号为+的时候前 i-1 个数字之和的列表
        /// **dp递推公式**
        ///     - dp[i][0] = dp[i-1]中每一个数字 - nums[i-1]
        ///     - dp[i][1] = dp[i-1]中每一个数字 + nums[i-1]
        var dp: [[[Int]]] = [[[0]]]
        var result: Int = 0
        for i in 1...N {
            /// 当前元素nums[i-1]取负号时候的前 i-1 个数字之和的列表
            var iMinusSum: [Int] = []
            /// 当前元素nums[i-1]取正号时候的前 i-1 个数字之和的列表
            var iPlusSum: [Int] = []
            /// 通过遍历上一轮dp中的所有数字来求取当前轮中的和
            for j in dp[i-1] {
                for pre in j {
                    /// 当前元素nums[i-1]取负号时候的前 i-1 个数字之和
                    let sum1 = pre - nums[i-1]
                    /// 当前元素nums[i-1]取正号时候的前 i-1 个数字之和
                    let sum2 = pre + nums[i-1]
                    iMinusSum.append(sum1)
                    iPlusSum.append(sum2)
                    /// 只在最后一轮的时候统计结果
                    if i == N {
                        if sum1 == target { result += 1 }
                        if sum2 == target { result += 1 }
                    }
                }
            }
            /// 更新dp
            dp.append([iMinusSum,iPlusSum])
        }
        return result
    }
}

class Solution {
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        let (N, sum): (Int, Int) = (nums.count, nums.reduce(0, +))
        if (sum - target < 0) || (sum - target) & 1 == 1 { return 0 }
        /// 新的目标和，问题转化为从数组中选取M个元素使得其和的为neg
        let neg = (sum - target)/2
        /// dp[i][j]表示前i个元素和为j的个数
        /// dp[i][0] = 0, dp[0][i] = 0
        var dp: [[Int]] = Array(
            repeating: Array(repeating: 0, count: neg + 1),
            count: N + 1
        )
        /// 注意初始条件，当没有数字时候要求和为0的次数为1，即不选择任何一个元素
        dp[0][0] = 1
        for i in 1...N {
            /// 注意j的取值范围，j可以取0
            for j in 0...neg {
                if j < nums[i-1] {
                    /// 目标和小于该数字则无法选择该数字此时保持上一次的结果
                    dp[i][j] = dp[i-1][j]
                } else {
                    /// 目标和大于等于该数字，可以选择该数字
                    /// 则总次数 = 选择该数字的次数 + 不选择该数字的次数
                    dp[i][j] = dp[i-1][j] + dp[i-1][j-nums[i-1]]
                }
            }
        }
        return dp[N][neg]
    }
}

let solution = Solution()
print(solution.findTargetSumWays([1,1,1,1,1], 3))   // 5
print(solution.findTargetSumWays([1], 1))           // 1
print(solution.findTargetSumWays([2,1,3], 3))       // 0

