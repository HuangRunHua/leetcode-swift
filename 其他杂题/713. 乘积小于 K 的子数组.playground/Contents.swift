import Foundation
/// **713. 乘积小于 K 的子数组**
/// 给你一个整数数组 nums 和一个整数 k ，请你返回子数组内所有元素的乘积严格小于 k 的连续子数组的数目。
///
/// **示例 1**
/// 输入：nums = [10,5,2,6], k = 100
/// 输出：8
/// 解释：8 个乘积小于 100 的子数组分别为：[10]、[5]、[2],、[6]、[10,5]、[5,2]、[2,6]、[5,2,6]。
/// 需要注意的是 [10,5,2] 并不是乘积小于 100 的子数组。
class Solution {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        if k <= 1 { return 0 }
        /// 滑动窗口左右指针
        var (left, right) = (0, 0)
        /// 连续子数组的数目
        var result: Int = 0
        /// 滑动窗口内元素的乘积结果
        var curMultuply: Int = 1
        // MARK: 滑动窗口部分
        while right < nums.count {
            /// 滑动窗口新插入的元素
            let insertNum = nums[right]
            right += 1
            /// 更新乘积结果
            curMultuply *= insertNum
            // MARK: 窗口收缩条件为乘积结果大于等于k，此时开始移动左边的指针
            while curMultuply >= k {
                /// 删除滑动窗口最左边的元素
                let popNumber = nums[left]
                left += 1
                /// 更新乘积结果
                curMultuply /= popNumber
            }
            // MARK: 次数添加上以right-1位置的元素结尾的子数组的个数
            /// result在结尾更新是为了保证获取到所有的子数组的个数
            /// 如果在`while curMultuply >= k {...}`上面更新将导致子数组少计算一些
            /// 设已知right与left，则以nums[right]元素结尾的子数组的个数计算公式为right-left+1
            result += (right - left)
        }
        return result
    }
}

let solution = Solution()
print(solution.numSubarrayProductLessThanK([10,5,2,6], 100))



