import Foundation

class Solution {
    func replaceSpace(_ s: String) -> String {
        var newStr = ""
        s.forEach { c in
            if c == " " {
                newStr += "%20"
            } else {
                newStr += String(c)
            }
        }
        return newStr
    }
}

let solution = Solution()
print(solution.replaceSpace("We are happy."))
