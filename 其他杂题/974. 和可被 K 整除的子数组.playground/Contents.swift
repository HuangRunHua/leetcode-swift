import Foundation
/// **974. 和可被 K 整除的子数组**
/// 给定一个整数数组 nums 和一个整数 k ，返回其中元素之和可被 k 整除的（连续、非空） 子数组 的数目。
/// 子数组 是数组的**连续**部分。
class Solution {
    func subarraysDivByK(_ nums: [Int], _ k: Int) -> Int {
        /// 前缀和字典，key为前缀和模k，value为出现的次数
        var dict: [Int: Int] = [0: 1]
        /// 遍历时候的前缀和
        var presum: Int = 0
        /// 存储最终的结果
        var result: Int = 0
        for num in nums {
            presum += num
            /// 此处+k并且再次%k的原因是由于presum可能为负数
            /// 负数的模默认也是负数，因此需要做该操作
            let modulus = (presum % k + k) % k
            /// 统计结果
            /// 如果在哈希表内已经存在另一个前缀和的模k的结果也是modulus，则说明可以构成子数组
            if let value = dict[modulus] {
                result += value
            }
            /// 更新结果
            dict[modulus, default: 0] += 1
        }
        return result
    }
}

let solution = Solution()
print(solution.subarraysDivByK([4,5,0,-2,-3,1], 5))     // 7
print(solution.subarraysDivByK([5], 9))                 // 0
