import Foundation
/// **1297. 子串的最大出现次数**
/// 给你一个字符串s ，请你返回满足以下条件且出现次数最大的**任意**子串的出现次数：
/// 子串中不同字母的数目必须小于等于 maxLetters 。
/// 子串的长度必须大于等于 minSize 且小于等于 maxSize 。
///
/// **示例 1**
/// 输入：s = "aababcaab", maxLetters = 2, minSize = 3, maxSize = 4
/// 输出：2
/// 解释：子串 "aab" 在原字符串中出现了 2 次。
/// 它满足所有的要求：2 个不同的字母，长度为 3 （在 minSize 和 maxSize 范围内）。
class Solution {
    func maxFreq(_ s: String, _ maxLetters: Int, _ minSize: Int, _ maxSize: Int) -> Int {
        let chars: [Character] = Array(s)
        var (left, right) = (0, 0)
        /// 滑动窗口中不同字符的个数
        var charSet: [Character: Int] = [:]
        /// 不同字符出现的次数
        var valid: Int = 0
        /// 滑动窗口中字符串出现的次数
        var strHashtable: [String: Int] = [:]
        // MARK: 滑动窗口
        while right < chars.count {
            // MARK: 右移窗口
            let insertChar = chars[right]
            right += 1
            charSet[insertChar, default: 0] += 1
            if charSet[insertChar]! == 1 { valid += 1 }
            
            // MARK: 窗口收缩
            while charSet.count > maxLetters || right - left > minSize {
                let popChar = chars[left]
                left += 1
                charSet[popChar, default: 0] -= 1
                if charSet[popChar]! == 0 {
                    valid -= 1
                    charSet.removeValue(forKey: popChar)
                }
            }
            // MARK: 更新窗口结果
            let curStr: String = String(Array(chars[left..<right]))
            /// 查看当前窗口中的字符串长度是否符合条件
            if curStr.count <= maxSize && curStr.count >= minSize {
                strHashtable[curStr, default: 0] += 1
            }
        }
        return strHashtable.values.max() ?? 0
    }
}

let solution = Solution()
print(solution.maxFreq("aababcaab", 2, 3, 4))   // 2
print(solution.maxFreq("aaaa", 1, 3, 3))        // 2
print(solution.maxFreq("aabcabcab", 2, 2, 3))   // 3
print(solution.maxFreq("abcde", 2, 3, 3))       // 0
