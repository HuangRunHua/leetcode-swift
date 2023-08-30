import Foundation
/// 438. 找到字符串中所有字母异位词
/// 给定两个字符串 s 和 p，找到 s 中所有 p 的 异位词 的子串，返回这些子串的起始索引。不考虑答案输出的顺序。
/// **异位词**指由相同字母重排列形成的字符串（包括相同的字符串）。
///
/// 示例 1:
/// 输入: s = "cbaebabacd", p = "abc"
/// 输出: [0,6]
/// 解释:
/// 起始索引等于 0 的子串是 "cba", 它是 "abc" 的异位词。
/// 起始索引等于 6 的子串是 "bac", 它是 "abc" 的异位词。
class Solution {
    /// 暴力破解法(非常不推荐将会导致超时，但是理解起来容易)
    func findAnagramsSolution1(_ s: String, _ p: String) -> [Int] {
        if s.count < p.count { return [] }
        var sList: [Character] = Array(s)
        var pList: [Character] = Array(p)
        var pLength: Int = pList.count
        var pDict: [Character: Int] = generateDict(pList)
        var res: [Int] = []
        for index in 0...sList.count-pLength {
            var windows: [Character] = []
            for offset in 0..<pLength {
                windows.append(sList[index + offset])
            }
            let windowsDict = generateDict(windows)
            if windowsDict == pDict { res.append(index) }
        }
        return res
    }
    
    private func generateDict(_ list: [Character]) -> [Character: Int] {
        var dict: [Character: Int] = [:]
        for char in list {
            dict[char, default: 0] += 1
        }
        return dict
    }
    
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        var (_s, _p) = (Array(s), Array(p))
        return slidingWindow(_s, _p)
    }
    
    /// 滑动窗口的思想O(n)
    func slidingWindow(_ s: [Character], _ p: [Character]) -> [Int] {
        var window: [Character: Int] = [:]
        var need: [Character: Int] = generateDict(p)
        // valid 表示滑动窗口中满足条件的字符的个数
        var (left, right, valid) = (0, 0, 0)
        var res: [Int] = []
        while (right < s.count) {
            // c是将要移入窗口的字符
            let char = s[right]
            // 右移窗口
            right += 1
            // 对窗口内的数据进行更新
            // 判断当前移入窗口的字符是否是p中有的字符
            if need.keys.contains(char) {
                // 如果包含该字符则添加到滑动窗口中
                window[char, default: 0] += 1
                // 通过计算某一个字符出现的次数是否完成来处理字符重复的问题
                if window[char] == need[char] { valid += 1 }
            }
            
            // 判断左侧窗口是否需要收缩
            while (right - left >= p.count) {
                // 当窗口符合条件时候将起始索引加入最终结果
                if valid == need.count { res.append(left) }
                // d 是将要移出窗口的字符
                let d = s[left];
                left += 1
                // 对窗口进行一系列更新
                if need.keys.contains(d) {
                    if window[d] == need[d] { valid -= 1 }
                    window[d, default: 0] -= 1
                }
            }
        }
        return res
    }
    
}

let solution = Solution()
print(solution.findAnagrams("abab", "ab"))
print(solution.findAnagrams("cbaebabacd", "abc"))
print(solution.findAnagrams("baa", "aa"))
