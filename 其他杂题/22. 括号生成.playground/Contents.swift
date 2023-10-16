import Foundation
/// **22. 括号生成**
/// 数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且**有效的**括号组合。
///
/// **示例 1**
/// 输入：n = 3
/// 输出：["((()))","(()())","(())()","()(())","()()()"]
class Solution {
    // MARK: 本题的核心思想在于如何在已知n-1对合法括号的情况下推导到n对合法括号。
    /// 本题类似n个骰子的概率题。
    /// dp的含义：
    ///     - dp[i]表示第i对所有的合法括号列表
    ///     - dp[0] = [""] 且 dp[1] = ["()"]
    ///     - dp[i]的递推公式为**"(" + dp[p]中任意一个合法括号 + ")" + dp[q]中任意一个合法括号**，其中**p+q=i-1**。
    ///     - 显然p的取值范围为0～i-1
    func generateParenthesis(_ n: Int) -> [String] {
        if n == 1 { return ["()"] }
        var dp: [[String]] = [[""], ["()"]]
        for i in 2...n {
            var cur: [String] = []
            for p in 0..<i {
                /// **取dp[p]中任意一个合法括号**
                for k in dp[p] {
                    /// **dp[q]中任意一个合法括号**
                    for l in dp[i-1-p] {
                        cur.append("(" + k + ")" + l)
                    }
                }
            }
            dp.append(cur)
        }
        return dp[n]
    }
}

let solution = Solution()
print(solution.generateParenthesis(2))
print(solution.generateParenthesis(3))
