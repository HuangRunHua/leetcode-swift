import Foundation
/// **1658. 将x减到0的最小操作数**
/// 给你一个整数数组 nums 和一个整数 x 。每一次操作时，你应当移除数组 nums 最左边或最右边的元素，
/// 然后从 x 中减去该元素的值。请注意，需要修改数组以供接下来的操作使用。
/// 如果可以将 x 恰好 减到 0 ，返回 最小操作数 ；否则，返回 -1 。
///
/// **示例 1**
/// 输入：nums = [1,1,4,2,3], x = 5
/// 输出：2
/// 解释：最佳解决方案是移除后两个元素，将 x 减到 0 。
class Solution {
    // MARK: 思路是在数组中找到最长的连续子数组，标记该子数组和为s1，则 s1 + x = 总数组和s
    func minOperations(_ nums: [Int], _ x: Int) -> Int {
        var (left, right) = (0, 0)
        /// 数组内元素的总和
        let sum: Int = nums.reduce(0, +)
        /// 如果原先数组的总和小于x则必然无法找到对应的子数组
        if sum < x { return -1 }
        /// 滑动窗口内元素的总和
        var windowSum: Int = 0
        var maxLength: Int = Int.min
        // MARK: 滑动窗口
        while right < nums.count {
            // MARK: 插入新元素到窗口内
            let insertNum = nums[right]
            right += 1
            windowSum += insertNum
            // MARK: 窗口收缩
            while left < nums.count && windowSum + x > sum {
                let popNum = nums[left]
                windowSum -= popNum
                left += 1
            }
            // MARK: 更新最大窗口结果
            if windowSum + x == sum {
                maxLength = max(maxLength, right - left)
            }
        }
        return maxLength == Int.min ? -1 : nums.count - maxLength
    }
}

let solution = Solution()
print(solution.minOperations([1,1,4,2,3], 5))       // 2
print(solution.minOperations([5,6,7,8,9], 4))       // -1
print(solution.minOperations([3,2,20,1,1,3], 10))   // 5
print(solution.minOperations([1,1], 3))             // -1
print(solution.minOperations([1,1], 2))             // 2
