import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var i = 0
        var j = nums.count - 1
        while (i < j) {
            if nums[i] + nums[j] < target {
                i += 1
            } else if nums[i] + nums[j] > target {
                j -= 1
            } else {
                return [nums[i], nums[j] ]
            }
        }
        return []
    }
}

let solution = Solution()
print(solution.twoSum([14,15,16,22,53,60], 76))
