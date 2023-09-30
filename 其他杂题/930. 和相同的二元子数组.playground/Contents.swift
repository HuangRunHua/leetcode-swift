import Foundation
/// **930. 和相同的二元子数组**
/// 给你一个二元数组 nums ，和一个整数 goal ，请你统计并返回有多少个和为 goal 的 非空 子数组。
/// 子数组 是数组的一段连续部分。
///
/// **示例 1**
/// 输入：nums = [1,0,1,0,1], goal = 2
/// 输出：4
/// 解释：有 4 个满足题目要求的子数组：[1,0,1]、[1,0,1,0]、[0,1,0,1]、[1,0,1]
class Solution {
    func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
        var preSum: [Int] = Array(repeating: 0, count: nums.count + 1)
        var result: Int = 0
        for i in 0..<nums.count {
            preSum[i+1] = preSum[i] + nums[i]
        }
        /// 前缀和字典，key表示前缀和，value表示前缀和出现的次数
        /// 注意一开始的时候需要在字典里面添加(0,1)
        var dict: [Int: Int] = [0: 1]
        for i in 0..<nums.count {
            /// 已知前i个元素的前缀和
            let rightSum = preSum[i+1]
            /// rightSum如果扣除前j个元素的前缀和可以得到goal，则说明有符合条件的子数组
            let leftSum = rightSum - goal
            result += dict[leftSum, default: 0]
            dict[rightSum, default: 0] += 1
        }
        return result
    }
}

class Solution2 {
    func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
        return slidingWindow(nums, goal) - slidingWindow(nums, goal - 1)
    }
    func slidingWindow(_ nums: [Int], _ goal: Int) -> Int {
        var (left, right) = (0, 0)
        var (lsum, rsum) = (0, 0)
        var result: Int = 0
        while right < nums.count {
            let insertNum = nums[right]
            rsum += insertNum
            right += 1
            
            while (rsum - lsum > goal) && (left < right) {
                let popNum = nums[left]
                // 计算左指针的前缀和
                lsum += popNum
                left += 1
            }
            result += (right - left)
        }
        return result
    }
}

let solution = Solution()
print(solution.numSubarraysWithSum([1,0,1,0,1], 2))
print(solution.numSubarraysWithSum([0,0,0,0,0], 0))
