import Foundation
/// 剑指 Offer 45. 把数组排成最小的数
/// 输入一个非负整数数组，把数组里所有数字拼接起来排成一个数，打印能拼接出的所有数字中最小的一个。
///
/// 示例 1:
/// 输入: `[10,2]`
/// 输出: `"102"`
///
/// 示例 2:
/// 输入: `[3,30,34,5,9]`
/// 输出: `"3033459"`
class Solution {
    func minNumber(_ nums: [Int]) -> String {
        var res: String = ""
        var numsString: [String] = nums.map({ String($0) })
        /// 解题的关键是 `x + y < y + x`
        numsString = numsString.sorted(by: { $0 + $1 < $1 + $0 })
        for str in numsString {
            res += str
        }
        return res
    }
}

let solution = Solution()
print(solution.minNumber([10,2]))
print(solution.minNumber([3,5,30,3,9]))
