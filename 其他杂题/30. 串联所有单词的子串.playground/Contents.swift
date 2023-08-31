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
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        let _s: [Character] = Array(s)
        return slidingWindow(_s, words)
    }
    
    private func slidingWindow(_ s: [Character], _ words: [String]) -> [Int] {
        /// 针对于words为单个字符的情况采用哈希表`key=char value=count`来存储
        /// 此时相当于将单个字符变成了单个字符串此时采用哈希表`key=word value=count`来存储
        let wordsDict: [String: Int] = generateHashTable(words)
        var need: [String: Int] = [:]
        var (left, right, valid): (Int, Int, Int) = (0, 0, 0)
        /// 用于存储当前搜索的字符串
        var tempStr: String = ""
        var tempStrs: [String] = []
        var resIndex: [Int] = []
        while right < s.count {
            /// 即将移入窗口的字符
            let char = s[right]
            right += 1
            /// 更新窗口内的数据
            /// 添加当前的数据到tempStr用于后续检查数据是否存在于哈希表中
            tempStr.append(char)
            /// 此时搜索的第一个字符的长度已经等于子串的长度，判断该搜索的字符是否属于其中一个子串
            if tempStr.count == words[0].count {
                /// 搜索的字符串属于哈希表中则更新临时哈希表
                if wordsDict.keys.contains(tempStr) {
                    need[tempStr, default: 0] += 1
                    if need[tempStr] == wordsDict[tempStr] {
                        valid += 1
                        
                    }
                } else {
                    /// 说明找到的单词不属于words中任意一个此时重制tempStr使其继续搜索其他单词
                    tempStr = ""
                }
            }
            print(tempStrs)
            /// 滑动窗口收缩的条件
            while right-left >= words.count*words[0].count {
                let popChar = s[left]
                left += 1
                if valid == wordsDict.count {
                    resIndex.append(left)
                    tempStrs.append(tempStr)
                    /// 重制tempStr使其继续搜索其他单词
                    tempStr = ""
                }
            }
        }
        return []
    }
    
    private func generateHashTable(_ words: [String]) -> [String: Int] {
        var res: [String: Int] = [:]
        for word in words { res[word, default: 0] += 1 }
        return res
    }
}

let solution = Solution()
solution.findSubstring("barfoothefoobarman", ["foo","bar"])
