import Foundation

class Solution {
    private let states: [[Character: Int]] = [
        /// 0. start with 'blank'
        [" ": 0, "s": 1, "d": 2, ".": 4],
        /// 1. 'sign' before 'e'
        ["d": 2, ".": 4 ],
        /// 2. 'digit' before 'dot'
        ["d": 2, ".": 3, "e": 5, " ": 8],
        /// 3. 'digit' after 'dot'
        ["d": 3, "e": 5, " ": 8],
        /// 4. 'digit' after 'dot' (‘blank’ before 'dot')
        ["d": 3],
        /// 5. 'e'
        ["s": 6, "d": 7],
        /// 6. 'sign' after 'e'
        ["d": 7],
        /// 7. 'digit' after 'e'
        ["d": 7, " ": 8],
        /// 8. end with 'blank'
        [" ": 8]
    ]
    
    func isNumberSolution1(_ s: String) -> Bool {
        /// Start with state 0
        var current_state: Int = 0
        for c in s {
            var t: Character = Character(" ")
            if c.isNumber { t = "d" }
            else if "+-".contains(where: { $0 == c }) { t = "s" }
            else if "eE".contains(where: { $0 == c }) { t = "e" }
            else if ". ".contains(where: { $0 == c }) { t = c }
            else { t = "?" }
            if let state_num = states[current_state][t] {
                current_state = state_num
            } else {
                return false
            }
        }
        return [2,3,7,8].contains(where: { $0 == current_state })
    }
        
    func isNumber(_ s: String) -> Bool {
        return s.range(of: #"^ *([-\+]?\d+((\.\d+)?|\.?)|([-\+]?\.\d+))([Ee][\+-]?\d+)? *$"#,
                       options: .regularExpression) != nil
    }
}

let solution = Solution()
print(solution.isNumber("0"))
print(solution.isNumber("e"))
print(solution.isNumber("."))
print(solution.isNumber("    .1  "))
print(solution.isNumber("     "))
print(solution.isNumber("-1E-16"))
