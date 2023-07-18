import Foundation

class Solution {
    /// 执行用时：44 ms, 在所有 Swift 提交中击败了 45.08% 的用户
    /// 内存消耗：14.4 MB, 在所有 Swift 提交中击败了 40.98% 的用户
    func reverseLeftWordsSolution1(_ s: String, _ n: Int) -> String {
        var tempString = ""
        var result = ""
        
        var searchIndex = 0
        
        for c in s {
            if searchIndex < n {
                tempString += String(c)
            } else {
                result += String(c)
            }
            searchIndex += 1
        }
        
        result += tempString
        return result
    }
    
    /// 执行用时：36 ms, 在所有 Swift 提交中击败了 93.44% 的用户
    /// 内存消耗：14.3 MB, 在所有 Swift 提交中击败了 54.10% 的用户
    func reverseLeftWordsSolution2(_ s: String, _ n: Int) -> String {
        return String(s.dropFirst(n) + s.prefix(n))
    }
    
    /// 执行用时：36 ms, 在所有 Swift 提交中击败了 93.44% 的用户
    /// 内存消耗：14.3 MB, 在所有 Swift 提交中击败了 54.10% 的用户
    func reverseLeftWords(_ s: String, _ n: Int) -> String {
        let startIndex = s.startIndex
        let endIndex = s.endIndex
        let index = s.index(startIndex, offsetBy: n)
        return String(s[index..<endIndex] + s[startIndex..<index])
    }
}

let solution = Solution()
// umghlrlose
print(solution.reverseLeftWords("lrloseumgh", 6))
