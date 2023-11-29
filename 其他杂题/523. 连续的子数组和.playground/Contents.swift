import Foundation
/// **523. 连续的子数组和**
/// 给你一个整数数组 `nums` 和一个整数 `k` ，编写一个函数来判断该数组是否含有同时满足下述条件的连续子数组：
/// 子数组大小 至少为 `2` ，且
/// 子数组元素总和为 `k` 的倍数。
/// 如果存在，返回 `true` ；否则，返回 `false` 。
/// 如果存在一个整数 `n` ，令整数 `x` 符合 `x = n * k` ，则称 `x` 是 `k` 的一个倍数。
/// `0` 始终视为 `k` 的一个倍数。
class Solution {
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        /// 前缀和字典，`key`为前缀和，`value`为该前缀和首次出现的索引
        var dict: [Int: Int] = [0:-1]
        /// 存储当前的前缀和
        var presum: Int = 0
        for (id, num) in nums.enumerated() {
            presum += num
            let modulus = presum % k
            /// 判断当前前缀和是否已经存在于字典中
            if let value = dict[modulus] {
                /// 如果已经存在，则判断当前的位置与首次出现的位置差大于`2`
                if id - value >= 2 {
                    return true
                }
            } else {
                /// 如果元素没有出现过，则只需存储首次出现的索引即可
                /// 只存储首次出现的索引而不是每次最后出现的索引是为了防止如下情况：
                /// `[12,0,0,0], k = 5`
                /// 在该数组中如果每次都存储最后出现的索引，则在计算`0`的索引的时候`id - value`始终为`1`
                dict[presum % k] = id
            }
        }
        return false
    }
}

let solution = Solution()
print(solution.checkSubarraySum([23,2,4,6,7], 6))            // true
print(solution.checkSubarraySum([23,2,6,4,7], 6))            // true
print(solution.checkSubarraySum([23,2,6,4,7], 13))           // false
print(solution.checkSubarraySum([23,0,0,0], 3))              // true
print(solution.checkSubarraySum([23,0,0], 3))              // true
print(solution.checkSubarraySum([23,0], 3))              // true
