import Foundation

class Solution {
    // total: 88 ms
    func majorityElementSolution1(_ nums: [Int]) -> Int {
        
        var table: [Int: Int] = [:]
        var count = Int(nums.count/2) + 1
        
        if count == 1 {
            return nums[0]
        } else {
            for num in nums {
                if let time = table[num] {
                    table[num] = time + 1
                    if time + 1 >= count {
                        return num
                    }
                } else {
                    table[num] = 1
                }
            }
        }
        return 0
    }
    
    // total: 84 ms
    func majorityElementSolution2(_ nums: [Int]) -> Int {
        return nums.sorted()[nums.count / 2]
      }
    
    // total: 88 ms
    func majorityElement(_ nums: [Int]) -> Int {
        var counter = 1
        var id: Int = 0
        var result = nums[id]
        for num in nums {
            if result == num {
                counter += 1
            } else {
                counter -= 1
                if counter == 0 {
                    result = nums[id]
                    counter = 1
                }
            }
            
            id += 1
        }
        return result
    }
}

let solution = Solution()
print(solution.majorityElement([30]))
print(solution.majorityElement([3,2,3]))
print(solution.majorityElement([2,2,1,1,1,2,2]))
