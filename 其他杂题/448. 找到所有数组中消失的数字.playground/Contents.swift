import Foundation
/// **448. 找到所有数组中消失的数字**
/// 给你一个含 `n` 个整数的数组 `nums` ，其中 `nums[i]` 在区间 `[1, n]` 内。
/// 请你找出所有在 `[1, n]` 范围内但没有出现在 `nums` 中的数字，并以数组的形式返回结果。
class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        let N: Int = nums.count
        let set = Set(nums)
        var result: [Int] = []
        for index in 1...N {
            if !set.contains(index) { result.append(index) }
        }
        return result
    }
}

let solution = Solution()
print(solution.findDisappearedNumbers([4,3,2,7,8,2,3,1]))
print(solution.findDisappearedNumbers([1,1]))
