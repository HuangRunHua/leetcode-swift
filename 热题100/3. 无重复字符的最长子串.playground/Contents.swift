import Foundation
/// **3.无重复字符的最长子串**
/// 给定一个字符串s，请你找出其中不含有重复字符的**最长子串**的长度。
///
/// 示例 1:
/// 输入: s = "abcabcbb"
/// 输出: 3
/// 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        /// 某字符上一次出现的位置索引
        var dict: [String: Int] = [:]
        /// 状态转移矩阵
        var dp: [Int] = Array(repeating: 0, count: s.count+1)
        /// 为了方便将String类型转为[String]获取索引方便
        var sArray: [String] = []
        s.forEach { c in sArray.append(String(c)) }
        
        for id in 0..<sArray.count {
            /// 获取同一个字符上一次出现的位置
            let lastIndex = dict[sArray[id], default: -1]
            /// 判断相同字符之间的距离d = id - lastIndex 与前一个最长子串的大小dp[i-1]谁大
            /// 如果 d 大于 dp[id-1] 则 dp[id] = dp[id-1] + 1
            /// 如果 d 小于等于 dp[id-1] 则 dp[id] = d
            dp[id+1] = id - lastIndex > dp[id] ? dp[id] + 1 : id - lastIndex
            dict[sArray[id]] = id
        }
        return dp.max() ?? 1
    }
}

let solution = Solution()
print(solution.lengthOfLongestSubstring("abcabcbb"))
print(solution.lengthOfLongestSubstring("bbbb"))
print(solution.lengthOfLongestSubstring("pwwkew"))
