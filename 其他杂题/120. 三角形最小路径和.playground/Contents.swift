import Foundation
/// **120. 三角形最小路径和**
/// 给定一个三角形 triangle ，找出自顶向下的最小路径和。
/// 每一步只能移动到下一行中相邻的结点上。**相邻的结点**在这里指的是**下标**与**上一层结点下标**相同或者
/// 等于**上一层结点下标 + 1** 的两个结点。
/// 也就是说，如果正位于当前行的下标 i ，那么下一步可以移动到下一行的下标 i 或 i + 1 。
///
/// 示例 1：
/// 输入：triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
/// 输出：11
/// 解释：如下面简图所示：
///    **2**
///  **3** 4
///  6 **5** 7
/// 4**1** 8  3
/// 自顶向下的最小路径和为 11（即，2 + 3 + 5 + 1 = 11）。
class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        let (N, M) = (triangle.count, triangle.last!.count)
        /// dp的含义
        ///     - dp[i][j]表示第i层第j个点的最小路径和
        ///     - dp[i][j] = min(dp[i-1][j], dp[i][j-1]) + triangle[i-1][j-1]
        var dp: [[Int]] = Array(repeating: Array(repeating: Int.max, count: M + 1), count: N + 1)
        for i in 1...N {
            for j in 1...(triangle[i-1].count) {
                if (i == 1) && (j == 1) { dp[i][j] = triangle[i-1][j-1] }
                else {
                    dp[i][j] = min(dp[i-1][j], dp[i-1][j-1]) + triangle[i-1][j-1]
                }
            }
        }
        return dp[N].min()!
    }
}

let solution = Solution()
print(solution.minimumTotal([[2],[3,4],[6,5,7],[4,1,8,3]]))
print(solution.minimumTotal([[-10]]))
