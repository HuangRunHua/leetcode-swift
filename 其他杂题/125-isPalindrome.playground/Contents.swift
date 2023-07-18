import Foundation

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var letters: String = ""
        
        var count = 0
        for c in s.lowercased() {
            if (String(c) >= "a") && (String(c) <= "z") || (String(c) >= "0") && (String(c) <= "9")   {
                letters += String(c)
                count += 1
            }
        }
        
        if letters == "" {
            return true
        }
        
        let length_for_compare = (count % 2 == 0) ? count/2: (count-1)/2
        let start = letters.startIndex
        let end = letters.endIndex
        
        let letters_1: String = String(letters[start..<letters.index(start, offsetBy: length_for_compare)])
        
        let letters_2: String = String(letters[letters.index(end, offsetBy: -length_for_compare)..<end].reversed())
        
        for (c1, c2) in zip(letters_1, letters_2) {
            if c1 != c2 {
                return false
            }
        }
        return true
    }
}

let solution = Solution()
print(solution.isPalindrome("A man, a plan, a canal: Panama"))
print(solution.isPalindrome("race a car"))
print(solution.isPalindrome(" "))
print(solution.isPalindrome("0P"))

