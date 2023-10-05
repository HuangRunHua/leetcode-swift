import Foundation
/// **746. 使用最小花费爬楼梯**
/// 给你一个整数数组 cost ，其中 cost[i] 是从楼梯第 i 个台阶向上爬需要支付的费用。一旦你支付此费用，即可选择向上爬一个或者两个台阶。
/// 你可以选择从下标为 0 或下标为 1 的台阶开始爬楼梯。
/// 请你计算并返回达到楼梯顶部的最低花费。
///
/// **示例 1**
/// 输入：cost = [10,15,20]
/// 输出：15
/// 解释：你将从下标为 1 的台阶开始。支付 15 ，向上爬两个台阶，到达楼梯顶部。总花费为 15 。
///
/// **示例 2**
/// 输入：cost = [1,100,1,1,1,100,1,1,100,1]
/// 输出：6
/// 解释：你将从下标为 0 的台阶开始。
/// - 支付 1 ，向上爬两个台阶，到达下标为 2 的台阶。
/// - 支付 1 ，向上爬两个台阶，到达下标为 4 的台阶。
/// - 支付 1 ，向上爬两个台阶，到达下标为 6 的台阶。
/// - 支付 1 ，向上爬一个台阶，到达下标为 7 的台阶。
/// - 支付 1 ，向上爬两个台阶，到达下标为 9 的台阶。
/// - 支付 1 ，向上爬一个台阶，到达楼梯顶部。
/// 总花费为 6 。
class Solution1 {
    // dp的含义:
    //  - dp[i]表示爬到第i层需要的最小花费
    //  - dp[0] = 0
    //  - dp[i] = min(dp[i-1] + cost[i-1], dp[i-2] + cost[i-2])
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        /// 注意到可以从下标为 0 或下标为 1 的台阶开始爬楼梯，因此在花费数组前加一个元素0
        /// 这样可以保证在从下标为1的台阶开始爬楼
        var _cost: [Int] = [0]
        _cost.append(contentsOf: cost)
        let N: Int = _cost.count
        var dp: [Int] = Array(repeating: 0, count: N + 1)
        for i in 1...N {
            if i == 1 {
                dp[i] = dp[i-1] + _cost[i-1]
            }
            else {
                dp[i] = min(dp[i-1] + _cost[i-1], dp[i-2] + _cost[i-2])
            }
        }
        return dp[N]
    }
}

class Solution2 {
    // dp的含义:
    //  - dp[i]表示爬到第i层需要的最小花费
    //  - dp[0] = 0 = dp[1]
    //  - dp[i] = min(dp[i-1] + cost[i-1], dp[i-2] + cost[i-2])
    // 隐藏的条件:
    //  题目只规定了从第0～N-1个台阶向上爬所需要的花费，同时又规定了**可以从下标为1的台阶开始爬楼梯**
    //  这表明爬到下标为1的台阶所需要的最小花费实际上为0，因此dp[1] = 0
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        let N: Int = cost.count
        var dp: [Int] = Array(repeating: 0, count: N + 1)
        for i in 2...N {
            dp[i] = min(dp[i-1] + cost[i-1], dp[i-2] + cost[i-2])
        }
        return dp[N]
    }
}

class Solution {
    // dp的含义:
    //  - dp[i]表示爬到第i层需要的最小花费
    //  - dp[0] = 0 = dp[1]
    //  - dp[i] = min(dp[i-1] + cost[i-1], dp[i-2] + cost[i-2])
    // 隐藏的条件:
    //  题目只规定了从第0～N-1个台阶向上爬所需要的花费，同时又规定了**可以从下标为1的台阶开始爬楼梯**
    //  这表明爬到下标为1的台阶所需要的最小花费实际上为0，因此dp[1] = 0
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        let N: Int = cost.count
        var (cur, pre): (Int, Int) = (0, 0)
        var result: Int = 0
        for i in 2...N {
            result = min(cur + cost[i-1], pre + cost[i-2])
            pre = cur
            cur = result
        }
        return result
    }
}

let solution = Solution()
print(solution.minCostClimbingStairs([1,100,1,1,1,100,1,1,100,1]))
print(solution.minCostClimbingStairs([10,15,20]))

