import Foundation
/// **828. 统计子串中的唯一字符**
/// 我们定义了一个函数 `countUniqueChars(s)` 来统计字符串 s 中的唯一字符，并返回唯一字符的个数。
/// 例如：s = "LEETCODE" ，则其中 "L", "T","C","O","D" 都是唯一字符，因为它们只出现一次，所以 countUniqueChars(s) = 5 。
/// 本题将会给你一个字符串 s ，我们需要返回 countUniqueChars(t) 的总和，其中 t 是 s 的子字符串。输入用例保证返回值为 32 位整数。
/// 注意，某些子字符串可能是重复的，但你统计时也必须算上这些重复的子字符串（也就是说，你必须统计 s 的所有子字符串中的唯一字符）。
class Solution {
    func uniqueLetterString(_ s: String) -> Int {
        let schars: [Character] = Array(s)
        /// 统计每一个字符在字符串中出现的位置
        var dict: [Character: [Int]] = [:]
        for index in 0..<schars.count { dict[schars[index],default: []].append(index) }
        // MARK: 解题思路
        /// 对每个字符，计算有多少子字符串仅包含该字符一次即可。
        /// 对于字符`c_i`，标记其上一次出现的位置为`c_j`, 下一次出现的位置为`c_k`，
        /// 则从`c_j`到`c_k`中仅包含`c_i`的子串共有`(c_i - c_j) * (c_k - c_i)`个
        ///
        /// 为了防止开头与结尾的字符找不到上一次的位置或下一次出现的位置，在此处添加上索引`-1`与`s`的长度`n`作为
        /// 上一次的位置或下一次出现的位置方便计算
        var result: Int = 0
        for var arr in dict.values {
            arr = [-1] + arr + [schars.count]
            for index in 1..<arr.count-1 {
                result += (arr[index] - arr[index - 1]) * (arr[index + 1] - arr[index])
            }
        }
        return result
    }
}



let solution = Solution()
print(solution.uniqueLetterString("ABC")) // 10
//print(solution.uniqueLetterString("ABA")) // 8
