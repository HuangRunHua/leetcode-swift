import Foundation
/// **217. 存在重复元素**
/// 给你一个整数数组 nums 。如果任一值在数组中出现至少两次 ，返回 true ；如果数组中每个元素互不相同，返回 false 。
class Solution {
    func containsDuplicateSolution1(_ nums: [Int]) -> Bool {
        var table: Set<Int> = []
        for num in nums {
            if table.contains(num) { return true }
            table.insert(num)
        }
        return false
    }
    
    /// **时间:** 516ms，击败 100.00%使用 Swift 的用户
    /// **内存:** 17.90MB，击败 82.14%使用 Swift 的用户
    func containsDuplicate(_ nums: [Int]) -> Bool {
        return Set(nums).count != nums.count
    }
}

let solution = Solution()
print(solution.containsDuplicate([1,2,3,1]))
print(solution.containsDuplicate([1,2,3,4]))
