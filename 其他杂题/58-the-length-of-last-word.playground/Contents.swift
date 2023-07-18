import Foundation

class Solution {
    
    // total: 4 ms
    func lengthOfLastWord(_ s: String) -> Int {
        let count = s.count
        let endIndex = s.endIndex
        
        var result: Int = 0
        var mark: Bool = false
        
        for id in 0..<count {
            let current = s[s.index(s.endIndex, offsetBy: -(id+1))]
            
            if mark {
                if current == " " {
                    break
                }
            }
            
            if ((current >= "A") && (current <= "Z")) || ((current >= "a") && (current <= "z")) {
                mark = true
                result += 1
            }
        }
        
        return result
    }
}

let solution = Solution()
print(solution.lengthOfLastWord("Hello World"))
print(solution.lengthOfLastWord("   fly me   to   the moon  "))
print(solution.lengthOfLastWord("luffy is still joyboy"))
print(solution.lengthOfLastWord("l"))
print(solution.lengthOfLastWord("a"))
