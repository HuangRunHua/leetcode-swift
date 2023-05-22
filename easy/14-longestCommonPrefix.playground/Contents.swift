import Foundation

class Solution {
    // total: 40 ms
    func longestCommonPrefixSolution1(_ strs: [String]) -> String {
        
        var result = ""
        
        if let first_str = strs.first {
            var id = 0
            var flag = 0
            for ref_c in first_str {
                for str in strs.dropFirst() {
                    let start_index = str.startIndex
                    if id < str.count {
                        if str[str.index(start_index, offsetBy: id)] != ref_c {
                            flag = 1
                        }
                    } else {
                        flag = 1
                    }
                }
                if flag == 1 {
                    break
                }
                id += 1
            }
            result = String(first_str[first_str.startIndex..<first_str.index(first_str.startIndex, offsetBy: id)])
        }
        
        return result
    }
    // total: 40 ms
    func longestCommonPrefixSolution2(_ strs: [String]) -> String {
        
        var result = ""
        
        if let first_str = strs.first {
            var id = 0
            var flag = 0
outerLoop:  for ref_c in first_str {
                for str in strs.dropFirst() {
                    let start_index = str.startIndex
                    if id < str.count {
                        if str[str.index(start_index, offsetBy: id)] != ref_c {
                            break outerLoop
                        }
                    } else {
                        break outerLoop
                    }
                }
                id += 1
            }
            result = String(first_str[first_str.startIndex..<first_str.index(first_str.startIndex, offsetBy: id)])
        }
        
        return result
    }
    // total: 12 ms
    func longestCommonPrefixSolution3(_ strs: [String]) -> String {
        if var first_str = strs.first {
            while first_str != "" {
                if strs.dropFirst(1).allSatisfy({ $0.hasPrefix(first_str) }) {
                    return first_str
                }
                first_str = String(first_str[first_str.startIndex ..< first_str.index(first_str.endIndex, offsetBy: -1)])
            }
        }
        return ""
    }
    // total: 12 ms
    func longestCommonPrefix(_ strs: [String]) -> String {
        var result = ""
        let sorted_strs = strs.sorted(by: { $0 < $1 })
        if let first_str = sorted_strs.first, let last_str = sorted_strs.last {
            for (c1, c2) in zip(first_str, last_str) {
                if c1 != c2 {
                    break
                }
                result += String(c1)
            }
        }
        
        return result
    }
}

let solution = Solution()
print(solution.longestCommonPrefix(["flower","flow","flight"]))

print(solution.longestCommonPrefix(["dog","racecar","car"]))

print(solution.longestCommonPrefix(["ab", "a"]))
