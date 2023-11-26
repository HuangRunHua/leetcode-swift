import Foundation
/// **100132. 统计美丽子字符串 II**
/// 给你一个字符串 `s` 和一个正整数 `k` 。
/// 用 `vowels` 和 `consonants` 分别表示字符串中元音字母和辅音字母的数量。
/// 如果某个字符串满足以下条件，则称其为 美丽字符串 ：
///     - `vowels == consonants`，即元音字母和辅音字母的数量相等。
///     - `(vowels * consonants) % k == 0`，即元音字母和辅音字母的数量的乘积能被 `k` 整除。
/// 返回字符串 s 中 非空美丽子字符串 的数量。
/// 子字符串是字符串中的一个连续字符序列。
class Solution {
    private func possibleW(_ k: Int) -> [Int] {
        /// 计算出所有满足条件的w
        /// `valid` 数组保存满足 `w^2 mod k = 0` 的所有 `w`
        var valid: [Int] = []
        for rem in 0..<k {
            if rem * rem % k == 0 {
                valid.append(rem)
            }
        }
        return valid
    }
    
    func beautifulSubstrings(_ s: String, _ k: Int) -> Int {
        let n = s.count
        /// 计算出所有满足条件的w
        let valid = possibleW(k)

        var result: Int = 0
        /// 前缀和哈希表
        ///     - `key`: 元音减辅音的值
        ///     - `value`: 满足元音减辅音的值一个哈希表
        ///         - `key`: `(V_r - w) % k` 的所有可能枚举
        ///         - `value`: 满足该枚举对应的个数
        var hashmap: [Int: [Int: Int]] = [:]
        /// 用长度为 0 的前缀初始化哈希表
        /// 一开始的时候元音、辅音的个数均为0，因此有元音减辅音的值 = 0
        hashmap[0] = [0: 1]
        /// `det`：前缀中元音减辅音的值
        /// `vowels`：前缀中元音的数量
        var (det, vowels) = (0, 0)

        for c in s {
            /// 计算`V_r - C_l = d`的值
            if "aeiou".contains(c) {
                det += 1
                vowels += 1
            } else {
                det -= 1
            }

            /// 通过枚举`w`来枚举所有可能的`(V_r - w) % k`的值`p`
            for w in valid {
                let p = (vowels - w) % k
                if let value = hashmap[det]?[p] {
                    result += value
                }
            }

            /// 用以字符`c`为结尾的前缀更新哈希表
            let detKey = det
            let cntKey = vowels % k
            hashmap[detKey, default: [:]][cntKey, default: 0] += 1
        }
        return result
    }
}


let solution = Solution()
print(solution.beautifulSubstrings("baeyh", 2)) // 2
//print(solution.beautifulSubstrings("abba", 1))  // 3
//print(solution.beautifulSubstrings("bcdf", 1))  // 0
