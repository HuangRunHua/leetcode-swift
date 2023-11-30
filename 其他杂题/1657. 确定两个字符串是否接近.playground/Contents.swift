import Foundation
/// **1657. 确定两个字符串是否接近**
/// 如果可以使用以下操作从一个字符串得到另一个字符串，则认为两个字符串 接近 ：
///     - 操作 1：交换任意两个 现有 字符。例如，`abcde -> aecdb`
///     - 操作 2：将一个 现有 字符的每次出现转换为另一个 现有 字符，并对另一个字符执行相同的操作。
///         例如，`aacabb -> bbcbaa`（所有 `a` 转化为 `b` ，而所有的 `b` 转换为 `a` ）
/// 你可以根据需要对任意一个字符串多次使用这两种操作。
/// 给你两个字符串`word1` 和 `word2`。如果`word1`和`word2`接近 ，就返回`true`；否则，返回 `false`。
class Solution {
    /// 两个字符串接近的充分必要条件为：
    ///     - 两个字符串出现的字符集相等
    ///     - 分别将两个字符串的字符出现次数数组进行排序后，两个数组从小到大一一相等。
    func closeStrings(_ word1: String, _ word2: String) -> Bool {
        var dict1: [Character: Int] = [:]
        var dict2: [Character: Int] = [:]
        for word in word1 { dict1[word, default: 0] += 1 }
        for word in word2 { dict2[word, default: 0] += 1 }
        if dict1.keys != dict2.keys { return false }
        for (count1, count2) in zip(dict1.values.sorted(), dict2.values.sorted()) {
            if count1 != count2 { return false }
        }
        return true
    }
}

let solution = Solution()
print(solution.closeStrings("abc", "bca"))         // true
print(solution.closeStrings("a", "aa"))            // false
print(solution.closeStrings("cabbba", "abbccc"))   // true
print(solution.closeStrings("cabbba", "aabbss"))   // false
