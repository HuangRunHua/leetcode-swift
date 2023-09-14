import Foundation
/// **395. 至少有 K 个重复字符的最长子串**
/// 给你一个字符串 s 和一个整数 k ，请你找出 s 中的最长子串，
/// 要求该子串中的每一字符出现次数都不少于 k 。返回这一子串的长度。
/// 如果不存在这样的子字符串，则返回 0。
///
/// **示例 1**
/// 输入：s = "aaabb", k = 3
/// 输出：3
/// 解释：最长子串为 "aaa" ，其中 'a' 重复了 3 次。
class Solution {
    func longestSubstring(_ s: String, _ k: Int) -> Int {
        let sList: [Character] = Array(s)
        var result: Int = 0
        // MARK: 进行字符种类的枚举操作
        /// 由于不清楚子字符串应该有多少种不同的字符，考虑到字符最多26种，采用枚举的办法来实现窗口的收缩
        /// 当窗口内部的字符种类total > 设定的字符种类kind的时候窗口收缩
        for kind in 1...26 {
            var (left, right) = (0, 0)
            /// 统计窗口内字符出现的次数
            var dict: [Character: Int] = [:]
            /// 统计窗口内出现的字符的总类
            var set: Set<Character> = []
            /// 统计窗口内字符出现次数大于k的个数,理论上valid应该等于set内元素的个数
            var valid: Int = 0
            /// 滑动窗口遍历部分
            while right < sList.count {
                /// 当前时刻插入的元素
                let insertChar = sList[right]
                right += 1
                dict[insertChar, default: 0] += 1
                set.insert(insertChar)
                /// 如果有一个字符长度至少大于等于k需要更新valid计数
                /// 判断是否等于k用于实现只更新一次valid计数
                if dict[insertChar]! == k {
                    valid += 1
                }
                /// 如果valid计数等于set内元素的个数说明该子字符串满足条件
                if valid == set.count {
                    /// 更新最长子字符串长度
                    result = max(result, right-left)
                }
                // MARK: 窗口收缩
                while set.count > kind {
                    /// 待移除的字符
                    let popChar = sList[left]
                    left += 1
                    /// 如果被移除的字符原先长度至少等于k则需要更新valid计数
                    /// 判断是否等于k用于实现只更新一次valid计数
                    if dict[popChar]! == k {
                        valid -= 1
                    }
                    /// 更新字符统计
                    dict[popChar]! -= 1
                    /// 如果窗口不在包含该字符则移除所有相关信息
                    if dict[popChar]! == 0 {
                        set.remove(popChar)
                        dict.removeValue(forKey: popChar)
                    }
                }
            }
        }
        return result
    }
}

let solution = Solution()
print(solution.longestSubstring("aaabb", 3))
print(solution.longestSubstring("ababbc", 2))
print(solution.longestSubstring("ababbcaaaaaa", 2))
print(solution.longestSubstring("abcdef", 5))
