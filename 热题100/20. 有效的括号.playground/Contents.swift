import Foundation
/// **20. 有效的括号**
/// 给定一个只包括`'('，')'，'{'，'}'，'['，']'`的字符串 s ，判断字符串是否有效。
///
/// 有效字符串需满足：
/// 1. 左括号必须用相同类型的右括号闭合。
/// 2. 左括号必须以正确的顺序闭合。
/// 3. 每个右括号都有一个对应的相同类型的左括号。
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
