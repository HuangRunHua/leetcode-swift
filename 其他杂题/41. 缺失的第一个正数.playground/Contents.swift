import Foundation
/// **41. 缺失的第一个正数**
/// 给你一个未排序的整数数组 `nums`，请你找出其中没有出现的最小的正整数。
/// 请你实现时间复杂度为`O(n)`并且只使用**常数级别**额外空间的解决方案。
/// https://leetcode.cn/problems/first-missing-positive/description/
class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums: [Int] = nums
        /// 将一个数组中属于在`[1, N]`范围内的数字原地交换到对应的位置，
        /// 如`1`最终位置为`nums[0]`, `2`最终位置为`nums[1]`，不属于`[1, N]`范围内的数字不用管。
        for id in 0..<nums.count {
            while (nums[id] >= 1 && nums[id] <= nums.count && nums[nums[id]-1] != nums[id]) {
                nums.swapAt(nums[id]-1, id)
            }
        }
        
        for id in 0..<nums.count {
            if nums[id] != id + 1 {
                return id + 1
            }
        }
        return nums.count + 1
    }
}

let solution = Solution()
print(solution.firstMissingPositive([1,2,0]))       // 3
print(solution.firstMissingPositive([3,4,-1,1]))    // 2
print(solution.firstMissingPositive([7,8,9,11,12])) // 1
print(solution.firstMissingPositive([1]))           // 2

