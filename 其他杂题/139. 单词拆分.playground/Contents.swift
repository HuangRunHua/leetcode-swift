import Foundation
/// **139. 单词拆分**
/// 给你一个字符串 s 和一个字符串列表 wordDict 作为字典。请你判断是否可以利用字典中出现的单词拼接出 s 。
/// 注意：不要求字典中出现的单词全部都使用，并且字典中的单词可以重复使用。
class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        /// `dp`的含义
        ///     - `dp[i]`表示前`i`个字符串是否可以拼接成功
        ///     - `dp[0] = true`
        ///     - `dp[i] = dp[j] && s[j...i] in wordDict`
        let sChars: [Character] = Array(s)
        let wordSets: Set<String> = Set(wordDict)
        let N: Int = sChars.count
        var dp: [Bool] = Array(repeating: false, count: N + 1)
        dp[0] = true
        for i in 1...N {
            for j in 0..<i {
                let curStr = String(Array(sChars[j...i-1]))
                /// 在后续的遍历中dp[i]的值可能会被覆盖为false，因此可以有两种解决办法:
                ///     1. 在前面添加上`dp[i] ||`；
                ///     2. 提前剪枝，判断`dp[i]`是否为`true`，如果是直接`break`即可。
                dp[i] = dp[i] || (dp[j] && wordSets.contains(curStr))
            }
        }
        return dp[N]
    }
}

let solution = Solution()
print(solution.wordBreak("leetcode", ["leet", "code"]))                                // true
print(solution.wordBreak("applepenapple", ["apple", "pen"]))                           // true
print(solution.wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"]))          // false
