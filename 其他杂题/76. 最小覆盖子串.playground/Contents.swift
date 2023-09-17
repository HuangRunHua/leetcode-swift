import Foundation
/// **76. 最小覆盖子串**
/// 给你一个字符串s、一个字符串t。返回s中涵盖t所有字符的最小子串。
/// 如果s中不存在涵盖t所有字符的子串，则返回空字符串""。
/// **注意：**
/// 对于t中重复字符，我们寻找的子字符串中该字符数量必须不少于t中该字符数量。
/// 如果s中存在这样的子串，我们保证它是唯一的答案。
///
/// **示例 1**
/// 输入：s = "ADOBECODEBANC", t = "ABC"
/// 输出："BANC"
/// 解释：最小覆盖子串"BANC"包含来自字符串t的'A'、'B'和'C'。
class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        let (_s, _t) = (Array(s), Array(t))
        return slidingWindow(_s, _t)
    }
    
    private func slidingWindowSolution1(_ s1: [Character], _ s2: [Character]) -> String {
        var window: [Character: Int] = [:]
        var need: [Character: Int] = generateDict(s2)
        var (left, right, valid) = (0, 0, 0)
        var res: [String] = []
        while (right < s1.count) {
            let char = s1[right]
            right += 1
            /// 更新数据
            if need.keys.contains(char) {
                window[char, default: 0] += 1
                if window[char] == need[char] {
                    valid += 1
                }
            }
            
            while (valid == need.count) {
                res.append(String(s1[left..<right]))
                let d = s1[left]
                left += 1
                if need.keys.contains(d) {
                    if window[d] == need[d] {
                        valid -= 1
                    }
                    window[d, default: 0] -= 1
                }
            }
        }
        return res.min(by: { $0.count < $1.count }) ?? ""
    }
    
    private func slidingWindow(_ s1: [Character], _ s2: [Character]) -> String {
        var window: [Character: Int] = [:]
        var need: [Character: Int] = generateDict(s2)
        var (left, right, valid) = (0, 0, 0)
        /// 最终计算结果，字符的起始索引与长度
        var (start, maxLength): (Int, Int) = (left, Int.max)
        while (right < s1.count) {
            let char = s1[right]
            right += 1
            /// 更新数据
            if need.keys.contains(char) {
                window[char, default: 0] += 1
                if window[char] == need[char] {
                    valid += 1
                }
            }
            
            while (valid == need.count) {
                if right - left < maxLength {
                    maxLength = right - left
                    start = left
                }
                let d = s1[left]
                left += 1
                if need.keys.contains(d) {
                    if window[d] == need[d] {
                        valid -= 1
                    }
                    window[d, default: 0] -= 1
                }
            }
        }
        return maxLength == Int.max ? "" : String(s1[start..<start+maxLength])
    }
    
    private func generateDict(_ s: [Character]) -> [Character: Int] {
        var dict: [Character: Int] = [:]
        for c in s { dict[c, default: 0] += 1 }
        return dict
    }
}

let solution = Solution()
print(solution.minWindow("ab", "eidbaooo"))
print(solution.minWindow("ab", "eidboaoo"))
print(solution.minWindow("ADOBECODEBANC", "ABC"))

