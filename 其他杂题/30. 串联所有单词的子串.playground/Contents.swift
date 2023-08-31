import Foundation
/// **30. 串联所有单词的子串**
/// 给定一个字符串 s 和一个字符串数组 words。 words 中所有字符串 长度相同。
/// s 中的 串联子串 是指一个包含  words 中所有字符串以任意顺序排列连接起来的子串。
///
/// 例如，如果 words = ["ab","cd","ef"]， 那么 "abcdef"， "abefcd"，
/// "cdabef"， "cdefab"，"efabcd"， 和 "efcdab" 都是串联子串。
/// **"acdbef" 不是串联子串，因为他不是任何 words 排列的连接。**
/// 返回所有串联子串在 s 中的开始索引。你可以以**任意顺序**返回答案。
///
/// **示例 1：**
/// 输入：s = "barfoothefoobarman", words = ["foo","bar"]
/// 输出：[0,9]
/// 解释：因为 words.length == 2 同时 words[i].length == 3，连接的子字符串的长度必须为 6。
/// 子串 "barfoo" 开始位置是 0。它是 words 中以 ["bar","foo"] 顺序排列的连接。
/// 子串 "foobar" 开始位置是 9。它是 words 中以 ["foo","bar"] 顺序排列的连接。
/// 输出顺序无关紧要。返回 [9,0] 也是可以的。
class Solution {
    private var wordsDict: [String: Int] = [:]
    private var slideLength: Int = 0
    private var results: [Int] = []
    private var s: [Character] = []
    private var words: [String] = []
    
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        self.s = Array(s)
        self.words = words
        self.wordsDict = generateHashTable(words)
        self.slideLength = words[0].count
        self.results = []
        return _findSubstring()
    }
    /// **思想: **第一层循环一次只移动一个字符，第二层循环的滑动窗口每次移动一个字符串的长度去匹配可能的结果
    /// 注意到第一层其实只需要移动单个字符的长度即可，因为后续的起始点均会被包括
    private func _findSubstring() -> [Int] {
        var (left, right): (Int, Int) = (0, 0)
        while right < slideLength {
            /// 从第一个字符开始，内部滑动窗口一次移动单个字符的长度
            slidingWindow(left, right)
            /// 当内部滑动窗口滑动到末尾时候代表以left开头的情况已经被扫描过了
            /// 从left+1开始继续按照单个字符串滑动窗口
            right += 1
            left += 1
        }
        return results
    }
    
    private func slidingWindow(_ left: Int, _ right: Int) {
        /// 针对于words为单个字符的情况采用哈希表`key=char value=count`来存储
        /// 此时相当于将单个字符变成了单个字符串此时采用哈希表`key=word value=count`来存储
        var (l, r, valid) = (left, right, 0)
        var window: [String: Int] = [:]
        while r <= s.count-slideLength {
            /// 即将移入窗口的字符串
            let curStr = String(s[r..<r+slideLength])
            /// 滑动窗口一次移动一个字符的长度
            r += slideLength
            /// 更新窗口内的数据
            if wordsDict.keys.contains(curStr) {
                window[curStr, default: 0] += 1
                if window[curStr] == wordsDict[curStr] {
                    valid += 1
                }
            }
            /// 滑动窗口收缩的条件
            while r-l >= words.count*words[0].count {
                if valid == wordsDict.count {
                    results.append(l)
                }
                /// 滑动窗口一次移动一个字符的长度
                let popStr: String = String(s[l..<l+slideLength])
                l += slideLength
                
                if wordsDict.keys.contains(popStr) {
                    if window[popStr] == wordsDict[popStr] {
                        valid -= 1
                    }
                    window[popStr, default: 0] -= 1
                }
            }
        }
    }
    
    private func generateHashTable(_ words: [String]) -> [String: Int] {
        var res: [String: Int] = [:]
        for word in words { res[word, default: 0] += 1 }
        return res
    }
}

let solution = Solution()
print(solution.findSubstring("barfoothefoobarman", ["foo","bar"]))
print(solution.findSubstring("wordgoodgoodgoodbestword", ["word","good","best","word"]))
print(solution.findSubstring("barfoofoobarthefoobarman", ["bar","foo","the"]))
print(solution.findSubstring("lingmindraboofooowingdingbarrwingmonkeypoundcake", ["fooo","barr","wing","ding","wing"]))
print(solution.findSubstring("wordgoodgoodgoodbestword", ["word","good","best","good"]))
print(solution.findSubstring("aniuzhirunhuarun", ["zhi","run","hua","run"]))
print(solution.findSubstring("aaaaaa", ["aa","aa"]))
print(solution.findSubstring("ababaab", ["ab","ba","ba"]))




