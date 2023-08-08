/// **15. 三数之和**
/// 给你一个整数数组 nums ，判断是否存在三元组 [nums[i], nums[j], nums[k]]
/// 满足 i != j、i != k 且 j != k ，同时还满足 nums[i] + nums[j] + nums[k] == 0 。
/// 请你返回所有和为 0 且不重复的三元组。
/// **注意：答案中不可以包含重复的三元组。**
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        /// Sorted the nums array first keep the minimum value at the beginning of the array.
        var _nums: [Int] = nums
        _nums.sort(by: { $0 < $1 })
        /// Fix the kth number, and noted that if _nums[k] > 0 there would be no answer
        /// for this question cause kth number represents the minimum value of the three numbers.
        for k in 0..<_nums.count-1 {
            if _nums[k] > 0 { break }
            if (k > 0) && (_nums[k] == _nums[k-1]) {
                /// Note that if kth number is equal to the (k-1)th number it would result in
                /// same numbers founded which sum is equal to 0. But the question requires unique
                /// tuple stored in a result array.
                continue
            }
            /// Create two new pointers, the first one stays at the (k+1)th position, and the second one
            /// begins at the end of the _nums array.
            var (left, right): (Int, Int) = (k + 1, _nums.count-1)
            while left < right {
                if _nums[k] + _nums[left] + _nums[right] > 0 {
                    right -= 1
                    /// Keep in mind that the (right-1)th number maybe the same with the (right)th number
                    /// If that happens we have to skip that number.
                    while left < right && _nums[right] == _nums[right + 1] { right -= 1 }
                }
                else if _nums[k] + _nums[left] + _nums[right] < 0 {
                    left += 1
                    /// Keep in mind that the (left+1)th number maybe the same with the (left)th number
                    /// If that happens we have to skip that number.
                    while left < right && _nums[left] == _nums[left - 1] { left += 1 }
                }
                else {
                    results.append([_nums[k], _nums[left], _nums[right]])
                    right -= 1
                    left += 1
                    while left < right && _nums[right] == _nums[right + 1] { right -= 1 }
                    while left < right && _nums[left] == _nums[left - 1] { left += 1 }
                }
            }
        }
        return results
    }
}

let solution = Solution()
print(solution.threeSum([-1,0,1,2,-1,-4]))

