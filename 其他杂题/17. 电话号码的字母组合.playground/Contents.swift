import Foundation
/// **17. 电话号码的字母组合**
/// 给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。答案可以按 任意顺序 返回。
///
/// 给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。
class Solution {
    private let hashtable: [Character: [Character]] = [
        "2": ["a", "b", "c"],
        "3": ["d", "e", "f"],
        "4": ["g", "h", "i"],
        "5": ["j", "k", "l"],
        "6": ["m", "n", "o"],
        "7": ["p", "q", "r", "s"],
        "8": ["t", "u", "v"],
        "9": ["w", "x", "y", "z"],
    ]
    
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty { return [] }
        let digits: [Character] = Array(digits)
        var results: [String] = []
        /// 当前每一轮选取的结果
        var current: [Character] = []
        backtrack(digits, &results, 0, &current)
        return results
    }
    
    
    /// 回溯过程根据数字选取对应的字符
    /// - Parameters:
    ///   - digits: 输入的所有电话号码
    ///   - results: 所有电话号码的字母组合
    ///   - index: 当前对照的数字索引
    ///   - current: 当前一轮的组合结果
    func backtrack(
        _ digits: [Character], _ results: inout [String],
        _ index: Int, _ current: inout [Character]
    ) {
        /// 如果数字索引已经到达输入电话号码的最后一位了，说明每一个数字都做了映射，可以直接添加到最终结果
        if index == digits.count {
            results.append(String(current))
            return
        }
        /// 根据字典查找当前数字对应的所有字母
        /// 遍历该字母组合，并将字母添加到当前组合结果中
        for char in hashtable[digits[index]]! {
            current.append(char)
            /// 回溯时需要更新`index`，保证下一次选取的字母来自下一个数字对应的字母映射
            backtrack(digits, &results, index + 1, &current)
            current.removeLast()
        }
    }
}

let solution = Solution()
/// `["ad","ae","af","bd","be","bf","cd","ce","cf"]`
print(solution.letterCombinations("23"))
/// `["a","b","c"]`
print(solution.letterCombinations("2"))
/// `[]`
print(solution.letterCombinations(""))
