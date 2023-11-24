import Foundation
/// **383. 赎金信**
/// 给你两个字符串：`ransomNote` 和 `magazine` ，判断 `ransomNote` 能不能由 `magazine` 里面的字符构成。
/// 如果可以，返回 `true`；否则返回 `false`。
/// `magazine` 中的每个字符只能在 `ransomNote` 中使用一次。
class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        let (ransomDict, magDict) = (_generateDict(ransomNote), _generateDict(magazine))
        if ransomDict.keys.count > magDict.keys.count { return false }
        for key in ransomDict.keys {
            if let count1 = ransomDict[key], let count2 = magDict[key] {
                if count1 > count2 {
                    return false
                }
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

let solution = Solution()
print(solution.canConstruct("aa", "aab"))
print(solution.canConstruct("a", "b"))
print(solution.canConstruct("aa", "ab"))
