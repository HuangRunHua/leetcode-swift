import Foundation

class Solution {
    // total: 4 ms
    func isValidSolution1(_ s: String) -> Bool {
        var stack: [String] = []
        
        for c in s {
            if c == "(" {
                stack.append(")")
            } else if c == "{" {
                stack.append("}")
            } else if c == "[" {
                stack.append("]")
            } else if c == ")" {
                if let last = stack.last {
                    if last != ")" {
                        return false
                    } else {
                        stack.popLast()
                    }
                } else {
                    return false
                }
            } else if c == "}" {
                if let last = stack.last {
                    if last != "}" {
                        return false
                    } else {
                        stack.popLast()
                    }
                } else {
                    return false
                }
            } else if c == "]" {
                if let last = stack.last {
                    if last != "]" {
                        return false
                    } else {
                        stack.popLast()
                    }
                } else {
                    return false
                }
            }
        }
        
        if stack.isEmpty {
            return true
        }
        return false
    }
    
    // total: 592 ms
    func isValid(_ s: String) -> Bool {
        var a = s
        while a.contains("{}") || a.contains("[]") || a.contains("()") {
            a = a.replacingOccurrences(of: "{}", with: "")
            a = a.replacingOccurrences(of: "()", with: "")
            a = a.replacingOccurrences(of: "[]", with: "")
        }
        return a.isEmpty
    }
}

let solution = Solution()
print(solution.isValid("()"))
print(solution.isValid("()[]{}"))
print(solution.isValid("(]"))
print(solution.isValid("(]()[])"))
print(solution.isValid("(()[])"))
print(solution.isValid("(("))
print(solution.isValid("))"))
