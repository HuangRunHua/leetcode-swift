import Foundation
/// **413. 等差数列划分**
/// 如果一个数列 至少有三个元素 ，并且任意两个相邻元素之差相同，则称该数列为等差数列。
/// 例如，[1,3,5,7,9]、[7,7,7,7] 和 [3,-1,-5,-9] 都是等差数列。
/// 给你一个整数数组 nums ，返回数组 nums 中所有为等差数组的**子数组**个数。
/// **子数组**是数组中的一个连续序列。
///
/// **示例 1**
/// 输入：nums = [1,2,3,4]
/// 输出：3
/// 解释：nums 中有三个子等差数组：[1, 2, 3]、[2, 3, 4] 和 [1,2,3,4] 自身。
class Solution1 {
    // MARK: 滑动窗口/双指针解法
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        let N = nums.count
        if N < 3 { return 0 }
        var (left, right) = (0, 1)
        var result: Int = 0
        while right < N {
            /// 由于左边指针不变，右边的指针变化，因此需要按如下方式比较判断子数组是否为等差数列
            if nums[left + 1] - nums[left] == nums[right] - nums[right - 1] {
                /// 等差数列每次增加一个元素，其子数组的个数增加了`right - left - 1`个
                result += (right - left - 1)
            } else {
                /// `left`设定为`right-1`是为了保证数组至少有三个元素，因为后面`right`会递增`1`
                left = right - 1
            }
            right += 1
        }
        return result
    }
}

class Solution {
    // MARK: 动态规划解法
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        let N: Int = nums.count
        if N < 3 { return 0 }
        /// `dp`的定义以及递推公式
        ///     - `dp[i]`表示以当前第`i-1`元素结尾的等差数列的长度
        ///     - `dp[0] = 0` 并且`dp[1] = 1`同时`dp[2] = 2`
        ///     - 当`nums[i-1] - nums[i-2] == nums[i-2] - nums[i-3]`的时候`dp[i] = dp[i-1] + 1`
        var dp: [Int] = Array(repeating: 2, count: N + 1)
        dp[0] = 0
        dp[1] = 1
        var result: Int = 0
        for i in 3...N {
            if nums[i-1] - nums[i-2] == nums[i-2] - nums[i-3] {
                dp[i] = dp[i-1] + 1
                if dp[i] >= 3 {
                    result += (dp[i] - 2)
                }
            }
        }
        return result
    }
}

let solution = Solution()
print(solution.numberOfArithmeticSlices([1,2,3,4]))            // 3
print(solution.numberOfArithmeticSlices([0,2,3,4,5]))          // 3
print(solution.numberOfArithmeticSlices([0,2,4,4,5]))          // 1
print(solution.numberOfArithmeticSlices([1]))                  // 0
