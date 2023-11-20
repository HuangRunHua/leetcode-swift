import Foundation
/// **387. 字符串中的第一个唯一字符**
/// 给定一个字符串 s ，找到它的第一个不重复的字符，并返回它的索引。如果不存在，则返回 -1。
///
/// **示例 1**
/// 输入: s = "leetcode"
/// 输出: 0
class Solution {
    func firstUniqChar(_ s: String) -> Int {
        let sChars: [Character] = Array(s)
        var dict: [Character: Int] = [:]
        for char in sChars {
            dict[char, default: 0] += 1
        }
        for i in 0..<sChars.count {
            if dict[sChars[i]]! == 1 {
                return i
            }
        }
        return -1
    }
}

let solution = Solution()
print(solution.firstUniqChar("leetcode"))            // 0
print(solution.firstUniqChar("loveleetcode"))        // 2
print(solution.firstUniqChar("aabb"))                // -1
