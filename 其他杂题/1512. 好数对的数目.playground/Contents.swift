import Foundation
/// **1512. 好数对的数目**
/// 给你一个整数数组 nums 。
/// 如果一组数字 (i, j) 满足 nums[i] == nums[j] 且 j > i ，就可以认为这是一组好数对。
/// 返回好数对的数目。
///
/// **示例 1**
/// 输入：nums = [1,2,3,1,1,3]
/// 输出：4
/// 解释：有 4 组好数对，分别是 (0, 3), (0, 4), (3, 4), (2, 5) ，下标从 0 开始。
class Solution {
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        /// 哈希表先统计一波每一个数字出现的次数
        var hashtable: [Int: Int] = [:]
        for num in nums {
            hashtable[num, default: 0] += 1
        }
        /// 最终结果
        var result: Int = 0
        for value in hashtable.values {
            /// 每一个字符出现的次数设为N，则两两配对的个数为N(N-1)/2
            result += (value*(value-1)/2)
        }
        return result
    }
}

let solution = Solution()
print(solution.numIdenticalPairs([1,2,3,1,1,3]))
