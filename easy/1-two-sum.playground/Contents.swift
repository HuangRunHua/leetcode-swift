import Foundation

class Solution {
    // total: 84 ms
    func twoSumSolution1(_ nums: [Int], _ target: Int) -> [Int] {
        var index = 0
        for num in nums {
            let rest_nums = nums.dropFirst(index+1)
            if let second_num = rest_nums.first(where: { ($0 + num == target)}) {
                if let second_num_index = rest_nums.firstIndex(of: second_num) {
                    return [index, second_num_index]
                }
            }
            index += 1
        }
        return []
    }
    
    // total: 124 ms
    func twoSumSolution2(_ nums: [Int], _ target: Int) -> [Int] {
        var index = 0
        for num in nums {
            if let second_num = nums.first(where: { ($0 + num == target)}) {
                if let second_num_index = nums.firstIndex(of: second_num) {
                    if second_num_index != index {
                        return [index, second_num_index]
                    }
                }
            }
            index += 1
        }
        return []
    }
    
    // total: 76 ms
    func twoSumSolution3(_ nums: [Int], _ target: Int) -> [Int] {
        var first_index = 0
        for num in nums {
            let rest_nums = nums.dropFirst(first_index+1)
            
            var second_index = 0
            for num2 in rest_nums {
                if num2 + num == target {
                    return [first_index, second_index+first_index+1]
                }
                second_index += 1
            }
            first_index += 1
        }
        return []
    }
    
    // total: 60 ms
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var nums_dict: [Int: Int] = [:]
        
        var id = 0
        for num in nums {
            if let value = nums_dict[num] {
                return [id, value]
            }
            nums_dict[target-num] = id
            id += 1
        }
        return []
    }
}


// Test 1
let solution = Solution()
var results = solution.twoSum([3,3], 6)
print(results)

// Test 2
results = solution.twoSum([2,7,11,15], 9)
print(results)

results = solution.twoSum([3,2,4], 6)
print(results)

results = solution.twoSum([2,5,5,11], 10)
print(results)
