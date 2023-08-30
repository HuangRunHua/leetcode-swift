import Foundation
/// 567. 字符串的排列
/// 给你两个字符串 s1 和 s2 ，写一个函数来判断 s2 是否包含 s1 的排列。
/// 如果是，返回 true；否则，返回 false 。
///
/// 换句话说，s1 的排列之一是 s2 的 子串 。
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

