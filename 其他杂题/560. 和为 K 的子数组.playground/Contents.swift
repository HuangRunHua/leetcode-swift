import Foundation
/// **560. 和为 K 的子数组**
/// 给你一个整数数组 nums 和一个整数 k ，请你统计并返回 该数组中和为 k 的连续子数组的个数。
///
/// **示例 1：**
/// 输入：nums = [1,1,1], k = 2
/// 输出：2
class Solution {
    /// 本题无法使用滑动窗口/双指针来做
    /// **双指针和滑动窗口使用的一个必要条件就是能一步一步迭代，确定窗口的收缩方向**
    /// 题目中可能有负数，就完全不知道是左边缩小，还是右边缩小了。
    /// nums[i]可以小于0，也就是说右指针 i 向后移1位不能保证区间会增大，
    /// 左指针 j 向后移1位也不能保证区间和会减小。给定j，i的位置没有二段性
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var result: Int = 0
        /// 前缀和字典，key为前缀和，value为该前缀和出现的次数
        /// 前缀和表示前j个元素的和
        var preSumDict: [Int: Int] = [0: 1]
        /// 当前的前缀和
        var preSum: Int = 0
        for num in nums {
            preSum += num
            if let precount = preSumDict[preSum - k] {
                result += precount
            }
            preSumDict[preSum, default: 0] += 1
        }
        return result
    }
}

let solution = Solution()
print(solution.subarraySum([1,2,3], 3))
