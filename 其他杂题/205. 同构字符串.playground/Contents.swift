import Foundation
/// **205. 同构字符串**
/// 给定两个字符串 s 和 t ，判断它们是否是同构的。
/// 如果 s 中的字符可以按某种映射关系替换得到 t ，那么这两个字符串是同构的。
/// 每个出现的字符都应当映射到另一个字符，同时不改变字符的顺序。
/// 不同字符不能映射到同一个字符上，相同字符只能映射到同一个字符上，字符可以映射到自己本身。
class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        let schars: [Character] = Array(s)
        let tchars: [Character] = Array(t)
        /// 表示将s变成t的映射
        var s2tHashtable: [Character: Character] = [:]
        /// 表示将t变成s的映射
        var t2sHashtable: [Character: Character] = [:]
        for (schar, tchar) in zip(schars, tchars) {
            if let transChar = s2tHashtable[schar] {
                if transChar != tchar { return false }
            }
             if let transChar2 = t2sHashtable[tchar]  {
                if  transChar2 != schar { return false }
            }
            s2tHashtable[schar] = tchar
            t2sHashtable[tchar] = schar
        }
        return true
    }
}

let solution = Solution()
print(solution.isIsomorphic("paper", "title"))          // T
print(solution.isIsomorphic("egg", "add"))              // T
print(solution.isIsomorphic("foo", "bar"))              // F
print(solution.isIsomorphic("bbbaaaba", "aaabbbba"))    // F
print(solution.isIsomorphic("badc", "baba"))            // F
