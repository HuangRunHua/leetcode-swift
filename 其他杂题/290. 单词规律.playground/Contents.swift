import Foundation
/// **290. 单词规律**
/// 给定一种规律 pattern 和一个字符串 s ，判断 s 是否遵循相同的规律。
/// 这里的遵循指完全匹配，例如，pattern 里的每个字母和字符串 s 中的每个非空单词之间存在着双向连接的对应规律。
class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        let pChars: [Character] = Array(pattern)
        let sArray: [String] = s.split(separator: " ").map({ String($0) })
        if pChars.count != sArray.count { return false }
        var (p2s, s2p):([Character: String], [String: Character]) = ([:], [:])
        for (p, _s) in zip(pChars, sArray) {
            if let sFromP = p2s[p] {
                if sFromP != _s { return false }
            }
            p2s[p] = _s
            if let pFromS = s2p[_s] {
                if pFromS != p { return false }
            }
            s2p[_s] = p
        }
        return true
    }
}

let solution = Solution()
print(solution.wordPattern("abba", "dog cat cat dog"))      // true
print(solution.wordPattern("abba", "dog cat cat fish"))     // false
print(solution.wordPattern("aaaa", "dog cat cat dog"))      // false
print(solution.wordPattern("aaa", "dog dog dog dog"))      // false



