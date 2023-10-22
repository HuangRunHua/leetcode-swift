import Foundation
/// **91. 解码方法**
/// 一条包含字母 A-Z 的消息通过以下映射进行了**编码**：
/// 'A' -> "1"
/// 'B' -> "2"
/// ...
/// 'Z' -> "26"
/// 要**解码**已编码的消息，所有数字必须基于上述映射的方法，反向映射回字母（可能有多种方法）。例如，"11106" 可以映射为：
/// "AAJF" ，将消息分组为 (1 1 10 6)
/// "KJF" ，将消息分组为 (11 10 6)
/// 注意，消息不能分组为  (1 11 06) ，因为 "06" 不能映射为 "F" ，这是由于 "6" 和 "06" 在映射中并不等价。
/// 给你一个只含数字的 非空 字符串 s ，请计算并返回**解码**方法的**总数**。
/// 题目数据保证答案肯定是一个 32 位 的整数。
/// **示例 1**
/// 输入：s = "12"
/// 输出：2
/// 解释：它可以解码为 "AB"（1 2）或者 "L"（12）。
class Solution {
    func numDecodings(_ s: String) -> Int {
        let sChars: [String] = Array(s).map({ String($0) })
        let N: Int = sChars.count
        /// dp[i]表示前i个数字的解码总数
        var dp: [Int] = Array(repeating: 0, count: N + 1)
        dp[0] = 1
        for i in 1...N {
            /// 使用当前字符进行解码的情况
            if sChars[i-1] != "0" {
                dp[i] = dp[i] + dp[i-1]
            }
            /// 使用连续的两个字符进行解码的情况
            /// 注意情况是互不影响的，因此可以累加
            if (i > 1 && sChars[i - 2] != "0" && (sChars[i-2] + sChars[i-1] <= "26")) {
                dp[i] = dp[i] + dp[i-2]
            }
        }
        return dp[N]
    }
}

let solution = Solution()
print(solution.numDecodings("12"))     // 2
print(solution.numDecodings("226"))    // 3
print(solution.numDecodings("06"))     // 0
print(solution.numDecodings("10"))     // 1
print(solution.numDecodings("2101"))   // 1
print(solution.numDecodings("10011"))  // 0

