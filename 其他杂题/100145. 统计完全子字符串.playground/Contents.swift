import Foundation
/// **100145. 统计完全子字符串**
/// 给你一个字符串 `word` 和一个整数 `k` 。
/// 如果 `word` 的一个子字符串 s 满足以下条件，我们称它是 完全字符串：
///     - `s` 中每个字符**恰好**出现 `k` 次。
///     - 相邻字符在字母表中的顺序**至多**相差`2` 。也就是说，`s` 中两个相邻字符 `c1` 和 `c2` ，它们在字母表中的位置相差**至多**为 `2` 。
/// 请你返回 `word` 中 **完全**子字符串的数目。
/// **子字符串** 指的是一个字符串中一段连续非空的字符序列。
class Solution {
    func countCompleteSubstrings(_ word: String, _ k: Int) -> Int {
        let chars: [Character] = Array(word)
        /// 最终结果
        var result: Int = 0
        // MARK: 分组循环寻找字符串中所有的分割点
        /// 外层循环：准备工作
        /// 内层循环：寻找最长的连续段的末尾位置
        var id: Int = 0
        while id < chars.count {
            /// 每一段的起始位置
            let start = id
            id += 1
            while id < chars.count && disLessThan2(chars[id], chars[id-1]) {
                id += 1
            }
            /// 此时处理`chars[start..<id]`这一段字符串
            /// 在里面找到满足每个字符**恰好**出现 `k` 次的子串的个数
            result += countSubstringsFitS1(Array(chars[start..<id]), k)
        }
        return result
    }
    
    /// 判断两个字符在字母表中的顺序是否**至多**相差`2`
    private func disLessThan2(_ char1: Character, _ char2: Character) -> Bool {
        return abs(Int(char1.asciiValue!) - Int(char2.asciiValue!)) <= 2
    }
    
    /// 字串中满足条件1的子串的个数
    private func countSubstringsFitS1(_ chars: [Character], _ k: Int) -> Int {
        var result: Int = 0
        /// 枚举字串中有多少个字符，设字符的个数为N，则由于需要重复出现k次，因此长度必须要是Nk
        /// 字母表中字符一共有26个，因此只需要遍历26次即可。
        for kind in 1...26 {
            let N: Int = kind*k
            if N > chars.count { break }
            else { result += slidingWindow(chars, N, k) }
        }
        
        return result
    }
    
    /// 寻找长度恰好为N的窗口构成的字符串是否满足条件1
    private func slidingWindow(_ chars: [Character], _ N: Int, _ k: Int) -> Int {
        var result: Int = 0
        var (left, right) = (0, 0)
        var dict: [Character: Int] = [:]
        while right < chars.count {
            let insertNum = chars[right]
            right += 1
            dict[insertNum, default: 0] += 1
            
            while right - left >= N {
                if dict.values.filter({ $0 == k }).count == dict.values.count {
                    result += 1
                }
                let popChar = chars[left]
                left += 1
                dict[popChar]! -= 1
                if dict[popChar] == 0 { dict.removeValue(forKey: popChar) }
            }
        }
        return result
    }
}

let solution = Solution()
print(solution.countCompleteSubstrings("igigee", 2))             // 3
print(solution.countCompleteSubstrings("aaabbbccc", 3))          // 6
