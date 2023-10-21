import Foundation
/// **64. 最小路径和**
/// 给定一个包含非负整数的 m x n 网格 grid ，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。
/// 说明：每次只能向下或者向右移动一步。
class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let (M, N): (Int, Int) = (grid[0].count, grid.count)
        /// dp的含义
        ///     - dp[i][j]表示到grid[i-1][j-1]的最小数字总和
        ///     - dp[i][1] = dp[i-1][1] + grid[i-1][0]且dp[1][j] = dp[1][j-1] + grid[0][j-1]
        ///     - dp[i][j] = min(dp[i-1][j], dp[i][j-1]) + grid[i-1][j-1]
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: M + 1), count: N + 1)
        
        for i in 1...N {
            for j in 1...M {
                if i == 1 { dp[i][j] = dp[i][j-1] + grid[i-1][j-1] }
                else if j == 1 { dp[i][j] = dp[i-1][j] + grid[i-1][j-1] }
                else { dp[i][j] = min(dp[i-1][j], dp[i][j-1]) + grid[i-1][j-1] }
            }
        }
        return dp[N][M]
    }
}

let solution = Solution()
print(solution.minPathSum([[1,3,1],[1,5,1],[4,2,1]]))   // 7
print(solution.minPathSum([[1,2,3],[4,5,6]]))           // 12
