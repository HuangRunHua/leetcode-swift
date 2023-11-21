import Foundation
/// **389. 找不同**
/// 给定两个字符串 s 和 t ，它们只包含小写字母。
/// 字符串 t 由字符串 s 随机重排，然后在随机位置添加一个字母。
/// 请找出在 t 中被添加的字母。
class Solution {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        let sChars: [Character] = Array(s)
        let tChars: [Character] = Array(t)
        var sDict: [Character: Int] = [:]
        var tDict: [Character: Int] = [:]
        for sChar in sChars {
            sDict[sChar, default: 0] += 1
        }
        for tChar in tChars {
            tDict[tChar, default: 0] += 1
            if !sDict.keys.contains(tChar) {
                return tChar
            }
            if sDict[tChar]! < tDict[tChar]! {
                return tChar
            }
        }
        return Character("a")
    }
}

let solution = Solution()
print(solution.findTheDifference("abcd", "abcde"))              // e
print(solution.findTheDifference("", "y"))                      // y
print(solution.findTheDifference("a", "aa"))                    // a
