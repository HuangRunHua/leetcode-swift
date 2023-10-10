import Foundation
/// **面试题 05.03. 翻转数位**
/// 给定一个32位整数 num，你可以将一个数位从0变为1。请编写一个程序，找出你能够获得的最长的一串1的长度。
///
/// **示例 1**
/// 输入: num = 1775 (11011101111)
/// 输出: 8
class Solution1 {
    func reverseBits(_ num: Int) -> Int {
        let bits: [Int] = num2Bits(num)
        var (left, right) = (0, 0)
        var (lsum, rsum) = (0, 0)
        var result: Int = 0
        while right < bits.count {
            let insertNum = bits[right]
            right += 1
            rsum += (1 - insertNum)

            while rsum - lsum > 1 {
                let popNum = bits[left]
                left += 1
                lsum += (1 - popNum)
            }
            result = max(result, right - left)
        }
        return result
    }
    
    func num2Bits(_ num: Int) -> [Int] {
        var _num: Int = num < 0 ? -num : num
        var result: [Int] = Array(repeating: 0, count: 32)
        var index: Int = 0
        while _num > 0 {
            result[index] = _num % 2
            _num >>= 1
            index += 1
        }
        if num < 0 {
            for index in 0..<result.count {
                result[index] = (result[index] == 0) ? 1 : 0
            }
            plusOne(&result)
        }
        return result
    }
    
    func plusOne(_ nums: inout [Int]) {
        var plus = false
        for index in 0..<nums.count {
            if index == 0 {
                if nums[index] == 1 {
                    plus = true
                    nums[index] = 0
                } else {
                    nums[index] = 1
                    break
                }
            } else {
                if plus == true {
                    if nums[index] == 1 {
                        nums[index] = 0
                    } else {
                        nums[index] = 1
                        plus = false
                        break
                    }
                }
            }
        }
    }
}

class Solution {
    func reverseBits(_ num: Int) -> Int {
        /// cur: 当前一轮连续1的个数，遇到0就重制为0
        /// ones: 当前一轮从0开始往前数连续1的个数，遇到第一个0就默认等于当前一轮的最大1的个数
        /// result: 最终结果
        var (cur, insert, result) = (0, 0, 0)
        for i in 0..<32 {
            if (num & (1 << i)) > 0 {
                (cur, ones) = (cur + 1, ones + 1)
            } else {
                (ones, cur) = (cur + 1, 0)
            }
            result = max(result, insert)
        }
        return result
    }
}

let solution = Solution()
print(solution.reverseBits(1775))   // 8
print(solution.reverseBits(7))      // 4
print(solution.reverseBits(-1))     // 32
print(solution.reverseBits(-4))     // 31
