import Foundation

class Solution {
    /// 执行用时：40 ms, 在所有 Swift 提交中击败了 100.00% 的用户
    /// 内存消耗：19.8 MB, 在所有 Swift 提交中击败了 92.86% 的用户
    /// 通过测试用例：5 / 5
    func printNumbersSolution1(_ n: Int) -> [Int] {
        var result: [Int] = []
        let maxNumber = tenPow(n)
        for i in 1...maxNumber-1 {
            result.append(i)
        }
        return result
    }
    
    func tenPow(_ n: Int) -> Int {
        var res = 1
        for _ in 0..<n {
            res *= 10
        }
        return res
    }
    
    let numchars = "0123456789"
    
    func printNumbers(_ n: Int) -> [String] {
        var result: [String] = []
        var numStr = [Character](repeating: "0", count: n)
        addNumChar(&result, &numStr, 0)
        removeAllPrefixZero(&result, n)
        result.remove(at: 0)
        return result
    }
    
    func addNumChar(_ nums: inout [String],
                    _ numStr: inout [Character],
                    _ index : Int  ) {
        for ch in numchars {
            numStr[index] = ch
            if index < numStr.count - 1 {
                addNumChar(&nums , &numStr , index + 1)
            } else {
                nums.append(String(numStr))
            }
        }
    }
    
    func removeAllPrefixZero(_ nums: inout [String], _ n: Int) {
        for _ in 0..<n {
            for id in nums.indices {
                if let first = nums[id].first {
                    if first == "0" {
                        nums[id].removeFirst()
                    }
                }
            }
        }
    }
}

let solution = Solution()
print(solution.printNumbers(3))
