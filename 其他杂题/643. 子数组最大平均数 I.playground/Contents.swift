import Foundation
/// **643. 子数组最大平均数 I**
/// 给你一个由 n 个元素组成的整数数组 nums 和一个整数 k 。
/// 请你找出平均数最大且**长度为 k**的连续子数组，并输出该最大平均数。
///
/// **示例 1：**
/// 输入：nums = [1,12,-5,-6,50,3], k = 4
/// 输出：12.75
/// 解释：最大平均数 (12-5-6+50)/4 = 51/4 = 12.75
class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        var (left, right) = (0, 0)
        var maxSum: Int = Int.min
        var windowSum: Int = 0
        while right < nums.count {
            let insertNumber = nums[right]
            right += 1
            
            windowSum += insertNumber
            
            while right - left >= k {
                if maxSum < windowSum { maxSum = windowSum }
                
                let popNumber = nums[left]
                windowSum -= popNumber
                left += 1
            }
        }
        return Double(maxSum)/Double(k)
    }
}

let solution = Solution()
print(solution.findMaxAverage([1,12,-5,-6,50,3], 4))
