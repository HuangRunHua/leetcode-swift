import Foundation
/// **LCS 01. 下载插件**
/// 小扣打算给自己的VS Code安装使用插件，初始状态下带宽每分钟可以完成 1 个插件的下载。假定每分钟选择以下两种策略之一:
///     - 使用当前带宽下载插件
///     - 将带宽加倍（下载插件数量随之加倍）仅加宽需要占用1分钟时间
/// 请返回小扣完成下载 n 个插件最少需要多少分钟。
///
/// 注意：实际的下载的插件数量可以超过 n 个
class Solution {
    func leastMinutes(_ n: Int) -> Int {
        if n < 2 { return n }
        /// dp[i]表示下载到第i个插件最少需要的分钟数
        /// dp[0] = 0, dp[1] = 1
        /// dp[i] = min(dp[i-1] + 1, dp[(i+1)/2] + 1)
        var dp: [Int] = Array(repeating: Int.max, count: n + 1)
        dp[0] = 0
        dp[1] = 1
        for i in 2...n {
            /// 使用上一个时刻的带宽下载需要的时间：dp[i-1] + 1
            /// 使用带宽加倍下载需要的时间：dp[(i+1)/2] + 1。
            ///     dp[(i+1)/2]表示前期一直加带宽不下载，最后的加1表示只用一天就下载完成
            ///     为了保证最后一天能下载完成，因此需要(i+1)/2天来收集带宽。
            ///     如第5天需要到第三天的时候才能累积2^3=8个的下载量，第二天的累积下载量才2^2=4个无法下载。
            dp[i] = min(dp[i-1] + 1, dp[(i+1)/2] + 1)
        }
        return dp[n]
    }
}

let solution = Solution()
print(solution.leastMinutes(7))  // 4
print(solution.leastMinutes(4))  // 3
print(solution.leastMinutes(3))  // 3
print(solution.leastMinutes(2))  // 2



