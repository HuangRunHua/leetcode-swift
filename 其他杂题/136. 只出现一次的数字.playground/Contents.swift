import Foundation
/// **136. 只出现一次的数字**
/// 给你一个 非空整数数组 nums ，除了某个元素只出现一次以外，其余每个元素均出现两次。
/// 找出那个只出现了一次的元素。
/// 你必须设计并实现线性时间复杂度的算法来解决此问题，且该算法只使用常量额外空间。
///
/// **示例 1**
/// 输入：nums = [2,2,1]
/// 输出：1
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var result: Int = 0
        for num in nums {
            result ^= num
        }
        return result
    }
}

let solution = Solution()
print(solution.singleNumber([4,1,2,1,2]))
print(solution.singleNumber([2,2,1]))
