import Foundation
/// **63. 不同路径 II**
/// 一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为 “Start” ）。
/// 机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为 “Finish”）。
/// 现在考虑网格中有障碍物。那么从左上角到右下角将会有多少条不同的路径？
/// 网格中的障碍物和空位置分别用 1 和 0 来表示。
///
/// **示例：**
/// 输入：obstacleGrid = [[0,0,0],[0,1,0],[0,0,0]]
/// 输出：2
/// 解释：3x3 网格的正中间有一个障碍物。
/// 从左上角到右下角一共有 2 条不同的路径：
/// 1. 向右 -> 向右 -> 向下 -> 向下
/// 2. 向下 -> 向下 -> 向右 -> 向右
class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let (M, N) = (obstacleGrid[0].count, obstacleGrid.count)
        /// dp的含义
        ///     - dp[i][j]表示到达第i-1行第j-1位置的路径数目
        ///     - 显然有dp[0][j] = dp[i][0] = 0
        ///     - 初始位置Start如果没有障碍物即obstacleGrid[0][0] = 0则可以到达，方便后续推导设默认到达Start的路径一共1条，
        ///         如果obstacleGrid[0][0] = 1则Start也无法到达，此时dp[1][1] = 0
        ///     - 当前位置有阻碍即obstacleGrid[i-1][j-1]的时候dp[i-1][j-1] = 0; 当没有阻碍的时候，dp[i][j] = dp[i-1][j] + dp[i][j-1]
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: M + 1), count: N + 1)
        for i in 1...N {
            for j in 1...M {
                if obstacleGrid[i-1][j-1] == 1 { dp[i][j] = 0 }
                else {
                    if i == 1 && j == 1 {
                        dp[i][j] = 1
                    } else {
                        dp[i][j] = dp[i-1][j] + dp[i][j-1]
                    }
                }
            }
        }
        return dp[N][M]
    }
}

let solution = Solution()
print(solution.uniquePathsWithObstacles([[0,0,0],[0,1,0],[0,0,0]]))     // 2
print(solution.uniquePathsWithObstacles([[0,1],[0,0]]))                 // 1
print(solution.uniquePathsWithObstacles([[0,0]]))                       // 1

