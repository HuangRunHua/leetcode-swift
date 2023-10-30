import Foundation
/// **309. 买卖股票的最佳时机含冷冻期**
/// 给定一个整数数组prices，其中第prices[i]表示第 i 天的股票价格 。
/// 设计一个算法计算出最大利润。在满足以下约束条件下，你可以尽可能地完成更多的交易（多次买卖一支股票）:
/// 卖出股票后，你无法在第二天买入股票 (即冷冻期为 1 天)。
/// 注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let N: Int = prices.count
        /// **1. dp的含义**
        ///     - dp[i][0]表示当天手上没有股票情况下的最大利润
        ///     - dp[i][1]表示当天手上有股票情况下的最大利润
        /// **2. dp状态转移方程**
        ///     - dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i-1])
        ///     - dp[i][1] = max(dp[i-1][1], dp[i-2][0] - prices[i-1])
        var dp:[[Int]] = Array(
            repeating: Array(repeating: 0, count: 2),
            count: N + 1
        )
        for i in 1...N {
            if i == 1 { dp[i][1] = -prices[i-1] }
            else {
                /// 1. **dp[i-1][0]**：保持第i-2天(昨天)手上没有股票情况下的最大值
                /// 2. **dp[i-1][1] + prices[i-1]**：昨天手里有股票并在今天将股票卖出后获得的最大值
                dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i-1])
                /// 1. **dp[i-2][0] - prices[i-1]**： 第i-3天(大前天)交易完成之后手里没有股票情况下并
                ///     经过冷冻期后买入今天股票后的最大利润
                /// 2. **dp[i-1][1]**：保持第i-1天(昨天)手上有股票情况下的最大值
                dp[i][1] = max(dp[i-1][1], dp[i-2][0] - prices[i-1])
            }
        }
        return dp[N][0]
    }
}

let solution = Solution()
print(solution.maxProfit([1,2,3,0,2]))      // 3

