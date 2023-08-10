import Foundation
/// 1. 状态与选择
///  - 状态: 字符串的长度 m 与匹配字符的长度 n
///  - 选择: 匹配/不匹配
/// 2. dp数组的定义
///  - dp的维度: dp[m][n]是 m+1 行 n+1 列的数组
///  - dp的含义: dp[i][j] 表示字符串长度为 m， 匹配字符串长度为 n 的情况下是否匹配
///  - dp[0][0]显然为 true，dp[0..m][0] = false.
///  - 注意到*能使得前面的字符消失，因此dp[0][0...n]的值要取决于是否存在*号。
func isMatch(_ s: String, _ p: String) -> Bool {
    let (m, n): (Int, Int) = (s.count, p.count)
    var dp: [[Bool]] = Array(repeating: Array(repeating: false, count: n + 1), count: m + 1)
    dp[0][0] = true
    let (pStart, sStart) = (p.startIndex, s.startIndex)
    
    if n >= 2 {
        for j in 2...n {
            /// 判断正则表达式中当前字符是否为*，若不是，则表明j-2个字符无法被删除，显然匹配失败；
            /// 否则，则其可以删除两个元素，即“p[j-2]*”，此时若当正则表达式长度为 j-2 时候依然匹配成功，则当前dp[0][j]也可匹配成功。
            dp[0][j] = p[p.index(pStart, offsetBy: j-1)] == "*" && dp[0][j-2]
        }
    }
    
    if m >= 1  {
        for i in 1...m {
            if n >= 1 {
                for j in 1...n {
                    /// 判断匹配字符为"."还是"*"
                    if p[p.index(pStart, offsetBy: j-1)] == "*" {
                        /// 使用*的让前面的字符出现了0次，此时若当正则表达式长度为 j-2 时候依然匹配成功，则当前dp[0][j]也可匹配成功。
                        /// 使用*让前面的字符多出现1次，则需要确认*前面的字符与s当前的字符是否相同: p[j-2]* 与 s[i-1] 同时 dp[i-1][j]是否匹配成功
                        /// 此处为dp[i-1][j]是由于s使用了一个字符，因此长度变为i-1，p增加了一个字符，长度变成j+1，而后又使用了一个字符，恢复为j
                        dp[i][j] = dp[i][j-2] || (dp[i-1][j] &&
                                                  (p[p.index(pStart, offsetBy: j-2)] == s[s.index(sStart, offsetBy: i-1)] ||
                                                   p[p.index(pStart, offsetBy: j-2)] == "."))
                    } else {
                        dp[i][j] = ((p[p.index(pStart, offsetBy: j-1)] == s[s.index(sStart, offsetBy: i-1)]) ||
                                     p[p.index(pStart, offsetBy: j-1)] == ".") && dp[i-1][j-1]
                    }
                }
            }
        }
    }
    
    return dp[m][n]
}

print(isMatch("ab", ".*"))
print(isMatch("aa", "a"))
print(isMatch("", ".*"))
    



