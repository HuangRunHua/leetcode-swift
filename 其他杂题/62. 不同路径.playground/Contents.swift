import Foundation
/// **62. 不同路径**
/// 一个机器人位于一个 m x n 网格的左上角。
/// 机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为 “Finish” ）。
/// 问总共有多少条不同的路径？
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        /// dp的含义
        ///     - dp[i][j]表示到达第i-1行第j-1列位置的路径数目
        ///     - dp[i][0] = dp[0][j] = 0
        ///     - 由于每次只能向下或向右，因此dp[1][j] = 1，且dp[i][1] = 1
        ///     - dp[i][j] = dp[i-1][j] + dp[i][j-1]
        var dp:[[Int]] = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        for i in 1...m {
            for j in 1...n {
                if i == 1 || j == 1 { dp[i][j] = 1 }
                else { dp[i][j] = dp[i-1][j] + dp[i][j-1] }
            }
        }
        return dp[m][n]
    }
}

let solution = Solution()
//print(solution.uniquePaths(3,7))   // 28
//print(solution.uniquePaths(3,2))   // 3
//print(solution.uniquePaths(3,3))   // 6
print(solution.uniquePaths(5,5))   // 6
