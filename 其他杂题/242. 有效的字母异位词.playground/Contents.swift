import Foundation
/// **242. 有效的字母异位词**
/// 给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。
/// 注意：若 s 和 t 中每个字符出现的次数都相同，则称 s 和 t 互为字母异位词。
///
/// **示例 1**
/// 输入: `s = "anagram"`, `t = "nagaram"`
/// 输出: `true`
class Solution1 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        let (sdict, tdict) = (_generateDict(s), _generateDict(t))
        if sdict.keys.count != tdict.keys.count { return false }
        for key in sdict.keys {
            if let count1 = sdict[key], let count2 = tdict[key] {
                if count1 != count2 { return false }
            } else {
                return false
            }
        }
        return true
    }
    
    private func _generateDict(_ str: String) -> [Character: Int] {
        var res: [Character: Int] = [:]
        for c in str { res[c, default: 0] += 1 }
        return res
    }
}

class Solution {
    
    private let aASCII: Int = Int(Character("a").asciiValue!)
    
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
        var countArr: [Int] = Array(repeating: 0, count: 26)
        for (schar, tchar) in zip(s, t) {
            if let sascii = schar.asciiValue, let tascii = tchar.asciiValue {
                countArr[Int(sascii) - aASCII] += 1
                countArr[Int(tascii) - aASCII] -= 1
            }
        }
        
        for count in countArr {
            if count != 0 { return false }
        }
        return true
    }
}

let solution = Solution()
print(solution.isAnagram("anagram", "nagaram"))
print(solution.isAnagram("rat", "car"))
