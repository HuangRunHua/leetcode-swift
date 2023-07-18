import Foundation

class Solution {
    
    // total: 0 ms
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var mark: Int = 0
        // 事先存储count会使得速度变快
        let count = nums.count
        for var id in 0..<count {
            if nums[id] != val {
                nums[mark] = nums[id]
                mark += 1
            } else {
                id += 1
            }
        }
        return mark
    }
}


let solution = Solution()
var nums = [0,1,2,2,3,0,4,2]
print(solution.removeElement(&nums, 2))
print(nums)
