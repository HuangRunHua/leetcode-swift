import Foundation
/// **5. 最长回文子串**
/// 给你一个字符串 s，找到 s 中最长的回文子串。
/// 如果字符串的反序与原始字符串相同，则该字符串称为回文字符串。
///
/// **示例 1**
/// 输入：s = "babad"
/// 输出："bab"
/// 解释："aba" 同样是符合题意的答案。
class Solution {
    func longestPalindrome(_ s: String) -> String {
        let sChars: [Character] = Array(s)
        let N: Int = sChars.count
        if N < 2 { return s }
        // MARK: dp的含义
        ///     - dp[i][j]子字符串s[i...j]是否为回文字符串
        ///     - dp[i][i] = true
        ///     - 当字符串长度>2时候，当dp[i+1][j-1] = true且sChars[i+1] == sChars[j-1]时候dp[i][j] = true
        ///     - 当字符串长度小于等于2时候，dp[i][i+1] = (sChars[i] == sChars[i+1])
        var dp: [[Bool]] = Array(repeating: Array(repeating: false, count: N), count: N)
        var result: (maxLength: Int, beginIndex: Int) = (1, 0)
        for i in 0..<N { dp[i][i] = true }
        // MARK: 枚举子串的长度
        /// 从长度2开始，循环遍历回文串的长度，最长到N,即整个字符串就是一个回文串
        for length in 2...N {
            // MARK: 遍历每一个长度为length的子串判断其是否为回文串
            /// 从第一个字符开始，i表示起始索引
            for i in 0..<N {
                /// 计算子串最右边的索引，即j表示结束索引
                let j = i + length - 1
                /// 防止越界，即右边界索引不能超过字符串的最大长度
                if (j > N - 1) { break }
                // MARK: 依据两端元素是否相同进行回文串的判断
                /// 如果两端元素不相同则必然不是回文子串
                if (sChars[i] != sChars[j]) { dp[i][j] = false }
                else {
                    /// 如果两端元素相同，判断元素长度是否为3，如果是则必然为回文串
                    if j - i < 3 { dp[i][j] = true }
                    else {
                        /// 当内部子串sChars[i+1...j+1]为回文串的时候, sChars[i...j]必然为回文子串
                        dp[i][j] = dp[i+1][j-1]
                    }
                }
                // MARK: 处理最终结果
                if dp[i][j] && length > result.maxLength {
                    result.maxLength = length
                    result.beginIndex = i
                }
            }
        }
        return String(sChars[result.beginIndex..<(result.beginIndex + result.maxLength)])
    }
}

let solution = Solution()
print(solution.longestPalindrome("babad"))
