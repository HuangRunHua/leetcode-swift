import Foundation
/// **567. 字符串的排列**
/// 给你两个字符串 s1 和 s2 ，写一个函数来判断 s2 是否包含 s1 的排列。如果是，返回 true；否则，返回 false。
/// 换句话说，s1 的排列之一是 s2 的 子串 。
/// 示例 1：
/// 输入：s1 = "ab" s2 = "eidbaooo"
/// 输出：true
/// 解释：s2 包含 s1 的排列之一 ("ba").
class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let (_s1, _s2) = (Array(s1), Array(s2))
        return slidingWindow(_s1, _s2)
    }
    
    private func slidingWindow(_ s1: [Character], _ s2: [Character]) -> Bool {
        var window: [Character: Int] = [:]
        var need: [Character: Int] = generateDict(s1)
        var (left, right, valid) = (0, 0, 0)
        while (right < s2.count) {
            let char = s2[right]
            right += 1
            /// 更新数据
            if need.keys.contains(char) {
                window[char, default: 0] += 1
                if window[char] == need[char] { valid += 1 }
            }
            
            while (right - left >= s1.count) {
                if valid == need.count { return true }
                let d = s2[left]
                left += 1
                if need.keys.contains(d) {
                    if window[d] == need[d] { valid -= 1 }
                    window[d, default: 0] -= 1
                }
            }
        }
        return false
    }
    
    private func generateDict(_ s: [Character]) -> [Character: Int] {
        var dict: [Character: Int] = [:]
        for c in s { dict[c, default: 0] += 1 }
        return dict
    }
}

let solution = Solution()
print(solution.checkInclusion("ab", "eidbaooo"))
print(solution.checkInclusion("ab", "eidboaoo"))
print(solution.checkInclusion("abc", "bbbca"))

