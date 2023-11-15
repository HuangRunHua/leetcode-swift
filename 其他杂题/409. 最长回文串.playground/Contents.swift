import Foundation
/// **409. 最长回文串**
/// 给定一个包含大写字母和小写字母的字符串 s ，返回 通过这些字母构造成的 最长的回文串 。
/// 在构造过程中，请注意 区分大小写 。比如 "Aa" 不能当做一个回文字符串。
class Solution {
    func longestPalindrome(_ s: String) -> Int {
        let sChars: [Character] = Array(s)
        // MARK: 统计每一个字符出现的次数
        var hashtable: [Character: Int] = [:]
        for char in sChars {
            hashtable[char, default: 0] += 1
        }
        /// 奇数个字符出现的次数
        var oddCount: Int = 0
        /// 最终结果
        var result: Int = 0
        // MARK: 计算奇数个字符出现的次数
        for value in hashtable.values {
            if value & 1 == 1 { oddCount += 1 }
            result += value
        }
        // MARK: 筛选出现次数为奇数次的字符
        /// 如果奇数个字符出现的次数大于1次，此时只能选择其中最大的长度
        /// 作为回文字串的中间部分，剩下的奇数个字符分别取最接近其的偶数个
        /// 作为回文字串的两边部分因此需要扣除oddCount - 1个字符
        if oddCount > 1 {
            result -= (oddCount - 1)
        }
        return result
    }
}

let solution = Solution()
print(solution.longestPalindrome("abccccdd"))          // 7
print(solution.longestPalindrome("aaaaaccc"))          // 7
print(solution.longestPalindrome("a"))                 // 1
