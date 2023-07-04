import UIKit

class Solution {
    /// 执行用时：304 ms, 在所有 Swift 提交中击败了 7.32% 的用户
    /// 内存消耗：14.2 MB, 在所有 Swift 提交中击败了 63.42% 的用户
    /// 通过测试用例：105 / 105
    func firstUniqCharSolution1(_ s: String) -> Character {
        if s.isEmpty {
            return " "
        }
        var result: [String] = []
        s.forEach { c in
            if let index = result.firstIndex(where: { $0.first == c }) {
                result[index] += String(c)
            } else {
                result.append(String(c))
            }
        }
        return result.first(where: { $0.count == 1 })?.first ?? " "
    }
    
    /// 执行用时：48 ms, 在所有 Swift 提交中击败了 92.68% 的用户
    /// 内存消耗：14.1 MB, 在所有 Swift 提交中击败了 75.61% 的用户
    /// 通过测试用例：105 / 105
    func firstUniqCharSolution2(_ s: String) -> Character {
        if s.isEmpty {
            return " "
        }
        
        var charList: [Character] = []
        var counting: [Int] = []
        s.forEach { c in
            if let index = charList.firstIndex(of: c) {
                counting[index] += 1
            } else {
                charList.append(c)
                counting.append(1)
            }
        }
        
        if let index = counting.firstIndex(of: 1) {
            return charList[index]
        } else {
            return " "
        }
    }
    
    func firstUniqChar(_ s: String) -> Character {
        if s.isEmpty {
            return " "
        }
        
        var set: [Character: Int] = [:]
        
        s.forEach { c in
            if let value = set[c] {
                set[c]! += 1
            } else {
                set[c] = 1
            }
        }
        
        for c in s {
            if set[c] == 1 {
                return c
            }
        }
        
        return " "
    }
}

let solution = Solution()
print(solution.firstUniqChar("abaccdeff"))
print(solution.firstUniqChar(""))
print(solution.firstUniqChar("aadadaad"))
