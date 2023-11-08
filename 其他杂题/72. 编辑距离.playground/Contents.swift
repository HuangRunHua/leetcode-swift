import Foundation
/// **72. 编辑距离**
/// 给你两个单词 word1 和 word2， 请返回将 word1 转换成 word2 所使用的最少操作数  。
/// 你可以对一个单词进行如下三种操作：
///     1. 插入一个字符
///     2. 删除一个字符
///     3. 替换一个字符
///
/// **示例 1**
/// 输入：word1 = "horse", word2 = "ros"
/// 输出：3
/// 解释：
/// horse -> rorse (将 'h' 替换为 'r')
/// rorse -> rose (删除 'r')
/// rose -> ros (删除 'e')
class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        if word1.isEmpty { return word2.count }
        if word2.isEmpty { return word1.count }
        var chars1: [Character] = Array(word1)
        var chars2: [Character] = Array(word2)
        let (M, N) = (chars2.count, chars1.count)
        /// **dp的含义**
        ///     - `dp[i][j]`表示将word1前i个元素变成word2前j个元素所需要的最少操作数
        ///     - `dp[0][j] = j` 同时 `dp[i][0] = i`
        ///     -  `dp[i][j]`可以通过`dp[i-1][j]`, `dp[i][j-1]`与`dp[i-1][j-1]`共同推导出
        ///         -  `dp[i-1][j]`表示word1前i-1个字符变成word2前j个字符所需要的最少操作数，此时有`dp[i][j] = dp[i-1][j] + 1`
        ///         -  `dp[i][j-1]`表示word1前i个字符变成word2前j-1个字符所需要的最少操作数，此时有`dp[i][j] = dp[i][j-1] + 1`
        ///         -  `dp[i-1][j-1]`表示word1前i-1个字符变成word2前j-1个字符所需要的最少操作数，
        ///             此时需要判断word1[i]是否等于word2[j]，如果相同则`dp[i][j] = dp[i-1][j-1]`，否则`dp[i][j] = dp[i-1][j-1] + 1`
        var dp: [[Int]] = Array(
            repeating: Array(repeating: 0, count: M + 1),
            count: N + 1
        )
        for i in 1...N { dp[i][0] = i }
        for j in 1...M { dp[0][j] = j }
        
        for i in 1...N {
            for j in 1...M {
                let candidate1 = dp[i-1][j] + 1
                let candidate2 = dp[i][j-1] + 1
                let candidate3 = dp[i-1][j-1] + (chars1[i-1] == chars2[j-1] ? 0 : 1)
                dp[i][j] = min(candidate1, candidate2, candidate3)
            }
        }
        return dp[N][M]
    }
}

let solution = Solution()
print(solution.minDistance("horse", "ros"))                 // 3
print(solution.minDistance("b", "aab"))                     // 2
print(solution.minDistance("ab", "a"))                      // 1
print(solution.minDistance("bab", "a"))                     // 2
print(solution.minDistance("intention", "execution"))       // 5
print(solution.minDistance("sea", "eat"))                   // 2
