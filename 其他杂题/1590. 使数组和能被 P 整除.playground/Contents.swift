import Foundation
/// **1590. 使数组和能被 P 整除**
/// 给你一个正整数数组 `nums`，请你移除**最短**子数组（可以为空）
/// 使得剩余元素的**和**能被 `p` 整除。 不允许 将整个数组都移除。
/// 请你返回你需要移除的最短子数组的长度，如果无法满足题目要求，返回 `-1` 。
/// **子数组**定义为原数组中连续的一组元素。
class Solution {
    func minSubarray(_ nums: [Int], _ p: Int) -> Int {
        /// 求整个数组的和与`p`的模
        let k: Int = nums.reduce(0, +) % p
        if k == 0 { return 0 }
        /// 前缀和字典，`key`为前缀和对`p`的模，`value`为对应的下标
        /// 注意到这里`value`不是计算个数，是下标，因此初始化的时候可以添加`[0: -1]`
        var dict: [Int: Int] = [0:-1]
        /// 当前的前缀和
        var presum: Int = 0
        /// 最终的结果
        var result: Int = nums.count
        for (id, num) in nums.enumerated() {
            presum += num
            /// 注意到负数取模与正整数取模不一样，这里`presum - k`可能小于`p`
            if let value = dict[(presum - k + p) % p] {
                result = min(result, id - value)
            }
            dict[presum % p] = id
        }
        return result == nums.count ? -1 : result
    }
}

let solution = Solution()
print(solution.minSubarray([3,1,4,2], 6))            // 1
print(solution.minSubarray([6,3,5,2], 9))            // 2
print(solution.minSubarray([1,2,3], 3))              // 0
print(solution.minSubarray([1,2,3], 7))              // -1
