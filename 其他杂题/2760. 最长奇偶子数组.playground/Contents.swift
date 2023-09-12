import Foundation
/// **2760. 最长奇偶子数组**
/// 给你一个下标从 0 开始的整数数组 nums 和一个整数 threshold 。
/// 请你从 nums 的子数组中找出以下标 l 开头、下标 r 结尾 (nums.length >= r >= l >= 0) 且满足以下条件的**最长子数组**：
///     1. nums[l] % 2 == 0
///     2. 对于范围 [l, r - 1] 内的所有下标 i ，nums[i] % 2 != nums[i + 1] % 2
///     3. 对于范围 [l, r] 内的所有下标 i ，threshold >= nums[i]
/// 以整数形式返回满足题目要求的最长子数组的长度。
/// 注意：子数组 是数组中的一个连续非空元素序列。
///
/// **示例 1**
/// 输入：nums = [3,2,5,4], threshold = 5
/// 输出：3
/// 解释：在这个示例中，我们选择从 l = 1 开始、到 r = 3 结束的子数组 => [2,5,4] ，满足上述条件。
/// 因此，答案就是这个子数组的长度 3 。可以证明 3 是满足题目要求的最大长度。
class Solution {
    func longestAlternatingSubarraySolution1(_ nums: [Int], _ threshold: Int) -> Int {
        var res: Int = 0
        var (left, right) = (0, 0)
        
        while right < nums.count {
            /// 找到符合条件的起始元素
            if nums[right] % 2 == 1 || nums[right] > threshold {
                right += 1
            }
            else {
                /// 窗口的起始点固定
                left = right
                /// 窗口开始往外扩张
                right += 1
                /// 不断寻找符合条件的元素
                while right < nums.count && nums[right] <= threshold && nums[right] % 2 != nums[right-1] % 2 {
                    right += 1
                }
                res = max(res, right - left)
            }
        }
        return res
    }
    
    /// 采用动态规划的思想
    /// 1. 确认可变的状态：nums的长度
    /// 2. 确认dp相关信息
    ///     - dp为一维度数组
    ///     - dp[i]表示以第i个数字结尾的最长的子数组的长度
    ///     - dp[i] = 0 当 i > threshold 或者 i = 0时候
    ///     - dp[i] = dp[i-1] + 1 或 1
    func longestAlternatingSubarray(_ nums: [Int], _ threshold: Int) -> Int {
        let N = nums.count
        var dp: [Int] = Array(repeating: 0, count: N+1)
        for i in 1...N {
            /// 当前的数字大于阈值则最长子数组长度为0
            if nums[i-1] > threshold { dp[i] = 0 }
            else {
                /// 单独判断第一个数因为后续会访问到nums[i-2]
                if i == 1 {
                    if nums[i-1] % 2 == 0 { dp[i] = 1 }
                    else { dp[i] = 0 }
                }
                else {
                    /// 判断当前元素和前一个元素奇偶性是否不同
                    if nums[i-1] % 2 != nums[i-2] % 2 {
                        /// 奇偶性不同的时候要判断前一个元素是否是大于阈值的数，如[10,5], 9
                        /// 此时若dp[1] = 0, 当前元素为9 > 5, 5为奇数不符合起始条件因此dp[2] = 0
                        if dp[i-1] == 0 {
                            if nums[i-1] % 2 == 0 { dp[i] = dp[i-1] + 1 }
                            else { dp[i] = 0 }
                        } else {
                            dp[i] = dp[i-1] + 1
                        }
                    } else {
                        /// 奇偶性相同需要从新开始计数
                        if nums[i-1] % 2 == 0 { dp[i] = 1 }
                        else { dp[i] = 0 }
                    }
                }
            }
        }
        return dp.max()!
    }
}

let solution = Solution()
print(solution.longestAlternatingSubarraySolution1([3,2,5,4], 5)) // 3
print(solution.longestAlternatingSubarraySolution1([1,2], 2))     // 1
print(solution.longestAlternatingSubarraySolution1([2,3,4,5], 4)) // 3
print(solution.longestAlternatingSubarraySolution1([1], 1))       // 0
print(solution.longestAlternatingSubarraySolution1([4], 1))       // 0
print(solution.longestAlternatingSubarraySolution1([1,10,5], 9))  // 0
print(solution.longestAlternatingSubarraySolution1([1,11,6], 9))  // 1

