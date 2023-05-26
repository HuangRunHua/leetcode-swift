import Foundation

class Solution {
    
    // total: 48 ms
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if let first = nums.first {
            var id: Int = 1
            var temp_num: Int = first
            
            for num in nums {
                if num != temp_num {
                    nums[id] = num
                    temp_num = num
                    id += 1
                }
            }
            
            return id
            
        } else {
            return 0
        }
    }
}


let solution = Solution()
var nums = [0,0,1,1,1,2,2,3,3,4]
print(solution.removeDuplicates(&nums))
print(nums)


