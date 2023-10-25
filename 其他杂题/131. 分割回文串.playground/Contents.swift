import Foundation
/// **131. 分割回文串**
/// 给你一个字符串 s，请你将 s 分割成一些子串，使每个子串都是**回文串**。返回 s 所有可能的分割方案。
/// 回文串 是正着读和反着读都一样的字符串。
///
/// **示例 1**
/// 输入：s = "aab"
/// 输出：[["a","a","b"],["aa","b"]]
class Solution {
    func partition(_ s: String) -> [[String]] {
        let chars: [Character] = Array(s)
        let N: Int = chars.count
        // MARK: 动态规划部分
        /// dp的含义:
        ///     - dp[i][j]表示字符串s[i...j]是否为回文子串
        ///     - dp[i][j] = (s[i] == s[j] && dp[i+1][j-1])
        ///     - 考虑到对称性，此处只需要考虑 j >= i 的情况即可，注意到当i>j的时候实际为空字符串，因此此时dp[i][j] = true
        var dp: [[Bool]] = Array(repeating: Array(repeating: true, count: N), count: N)
        /// 预先统计子字符串是否为回文子串
        /// 注意此处i必须从后往前计算才可以
        for i in (0..<N).reversed() {
            for j in (i+1)..<N {
                dp[i][j] = (chars[i] == chars[j] && dp[i+1][j-1])
            }
        }
        // MARK: 回溯法部分
        var results: [[String]] = []
        var curString: [String] = []
        dfs(chars, 0, &results, &curString, dp)
        return results
    }
    
    func dfs(
        _ chars: [Character],
        _ index: Int,
        _ results: inout [[String]],
        _ curString: inout [String],
        _ dp: [[Bool]]
    ) {
        if index == chars.count {
            results.append(curString)
            return
        }
        for j in index..<chars.count {
            if dp[index][j] {
                curString.append(String(chars[index...j]))
                dfs(chars, j + 1, &results, &curString, dp)
                curString.removeLast()
            }
        }
    }
}

let solution = Solution()
print(solution.partition("aab"))
print(solution.partition("a"))
print(solution.partition("abbab"))

