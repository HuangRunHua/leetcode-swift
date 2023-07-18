/**
 *给你两个二进制字符串 a 和 b ，以二进制字符串的形式返回它们的和。
 *示例 1：
 *输入:a = "11", b = "1"
 *输出："100"
 
 *示例 2：
 *输入：a = "1010", b = "1011"
 *输出："10101"
 
 *提示：
 *1. 1 <= a.length, b.length <= 104
 *2. a 和 b 仅由字符 '0' 或 '1' 组成
 *3. 字符串如果不是 "0" ，就不含前导零
 */

import Foundation

class Solution {
    // total: 12 ms
    func addBinary(_ a: String, _ b: String) -> String {
        var result = ""
        var temp_stack: [Int] = []
        let a_count = a.count
        let b_count = b.count
        let a_reverse = String(a.reversed())
        let b_reverse = String(b.reversed())
        var id = 0
        for (c_1, c_2) in zip(a_reverse, b_reverse) {
            if id > 0 {
                if temp_stack[id-1] == 0 {
                    let sum = add(s1: String(c_1), s2: String(c_2))
                    result += sum.result
                    temp_stack.append(sum.mark)
                } else {
                    let sum_1 = add(s1: String(c_1), s2: String(c_2))
                    let sum_2 = add(s1: sum_1.result, s2: "1")
                    result += sum_2.result
                    temp_stack.append(max(sum_1.mark, sum_2.mark))
                    temp_stack[id - 1] = 0
                }
            } else {
                let sum = add(s1: String(c_1), s2: String(c_2))
                result += sum.result
                temp_stack.append(sum.mark)
            }
            id += 1
        }
        
        if id == max(a_count, b_count) {
            if temp_stack[id-1] == 1 {
                result += "1"
            }
        } else {
            let rest_s = (a_count > b_count) ? a_reverse[a_reverse.index(a_reverse.startIndex, offsetBy: id)..<a_reverse.endIndex] : b_reverse[b_reverse.index(b_reverse.startIndex, offsetBy: id)..<b_reverse.endIndex]
            
            if temp_stack[id-1] == 0 {
                result += String(rest_s)
            } else {
                var temp: [Int] = []
                var id_2: Int = 0
                for c in rest_s {
                    if id_2 == 0 {
                        let sum = add(s1: String(c), s2: "1")
                        result += sum.result
                        temp.append(sum.mark)
                    } else {
                        let sum = add(s1: String(c), s2: String(temp[id_2-1]))
                        result += sum.result
                        temp.append(sum.mark)
                    }
                    id_2 += 1
                }
                
                if temp[id_2-1] == 1 {
                    result += "1"
                }
            }
        }
        
        return String(result.reversed())
    }
    
    func add(s1: String, s2: String) -> (result: String, mark: Int) {
        if (s1 == s2) {
            if s1 == "0" {
                return ("0", 0)
            } else {
                return ("0", 1)
            }
        } else {
            return ("1", 0)
        }
    }
}

let solution = Solution()
print(solution.addBinary("11", "1"))
print(solution.addBinary("1010", "1011"))
print(solution.addBinary("100", "110010"))

