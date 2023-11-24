import Foundation
/// **2824. 统计和小于目标的下标对数目**
/// 给你一个下标从 `0` 开始长度为 `n` 的整数数组 `nums` 和一个整数 `target`，
/// 请你返回满足 `0 <= i < j < n` 且 `nums[i] + nums[j] < target` 的下标对 `(i, j)` 的数目。
class Solution {
    func countPairs(_ nums: [Int], _ target: Int) -> Int {
        /// 先对数组进行从小到大排序
        let _nums = nums.sorted(by: { $0 < $1 })
        /// 初始化双指针
        var (left, right) = (0, _nums.count - 1)
        /// 统计最终对数结果
        var result: Int = 0
        while left < right {
            /// 左指针先固定不动，移动右指针
            /// 右指针从最大的数字开始移动，直到移动到左右之和小于`target`的时候
            /// 此时左右指针之间的所有元素均可以凑成下标对
            while left < right && _nums[left] + _nums[right] >= target {
                right -= 1
            }
            /// 注意这里计算的是左指针不动，右指针可以移动到`left+1`时候的个数
            result += (right - left)
            /// 更新左指针的位置
            left += 1
        }
        return result
    }
}

let solution = Solution()
print(solution.countPairs([-1,1,2,3,1], 2))             // 3
print(solution.countPairs([-6,2,5,-2,-7,-1,3], -2))     // 10
