import Foundation

class Solution {
    // total: 60 ms
    func romanToIntSolution1(_ s: String) -> Int {
        let reference: [String: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000,
            "a": 4, // IV
            "b": 9, // IX
            "c": 40, // XL
            "d": 90, // XC
            "e": 400, // CD
            "f": 900, // CM
        ]
        var str = s
        str = str.replacingOccurrences(of: "IV", with: "a")
        str = str.replacingOccurrences(of: "IX", with: "b")
        str = str.replacingOccurrences(of: "XL", with: "c")
        str = str.replacingOccurrences(of: "XC", with: "d")
        str = str.replacingOccurrences(of: "CD", with: "e")
        str = str.replacingOccurrences(of: "CM", with: "f")
        
        var result: Int = 0
        for i in str {
            if let value = reference[String(i)] {
                result += value
            }
        }
        return result
    }
    
    // total: 16 ms
    func romanToInt(_ s: String) -> Int {
        let reference: [String: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000,
        ]
        
        var result: Int = 0
        let startIndex = s.startIndex
        let str_length = s.count
        for id in 0..<s.count {
            if id != str_length-1 {
                if (s[s.index(startIndex, offsetBy: id)] == "I") && ((s[s.index(startIndex, offsetBy: id+1)] == "V") || (s[s.index(startIndex, offsetBy: id+1)] == "X")) {
                    result -= 1
                }
                else if (s[s.index(startIndex, offsetBy: id)] == "X") && ((s[s.index(startIndex, offsetBy: id+1)] == "L") || (s[s.index(startIndex, offsetBy: id+1)] == "C")) {
                    result -= 10
                }
                else if (s[s.index(startIndex, offsetBy: id)] == "C") && ((s[s.index(startIndex, offsetBy: id+1)] == "D") || (s[s.index(startIndex, offsetBy: id+1)] == "M")) {
                    result -= 100
                }
                else {
                   if let value = reference[String(s[s.index(startIndex, offsetBy: id)])] {
                       result += value
                   }
               }
            }
            else {
               if let value = reference[String(s[s.index(startIndex, offsetBy: id)])] {
                   result += value
               }
           }
        }
        return result
    }
}

let solution = Solution()
print(solution.romanToInt("III"))
print(solution.romanToInt("IV"))
print(solution.romanToInt("IX"))
print(solution.romanToInt("LVIII"))
print(solution.romanToInt("MCMXCIV"))

