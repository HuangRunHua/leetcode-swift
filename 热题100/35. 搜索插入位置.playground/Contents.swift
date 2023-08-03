import Foundation
/// **35. 搜索插入位置**
/// 给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。
/// 如果目标值不存在于数组中，返回它将会被按顺序插入的位置。
/// **请必须使用时间复杂度为 O(log n) 的算法。**
class Solution {
    // total: 24 ms
    func searchInsertSolution1(_ nums: [Int], _ target: Int) -> Int {
        if let first = nums.first {
            var count = nums.count
            for id in 0..<count {
                if nums[id] == target {
                    return id
                } else {
                    if (nums[id] < target) {
                        if id < count-1 {
                            if (nums[id+1] >= target) {
                                return id + 1
                            }
                        } else {
                            return id + 1
                        }
                    } else {
                        return id
                    }
                }
            }
        }
        
        return 0
    }
    
    // total: 20 ms
    func searchInsertSolution2(_ nums: [Int], _ target: Int) -> Int {
        if let first = nums.first {
            var count = nums.count
            for id in 0..<count {
                if nums[id] >= target {
                    return id
                }
            }
        }
        return nums.count
    }
    
    // total: 20 ms
    // log(n)
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        let count = nums.count
        var left = 0
        var right = count-1
        
        while (left <= right) {
            let middle = Int((right+left)/2)
            if nums[middle] == target {
                return middle
            } else if nums[middle] > target {
                right = middle-1
            } else {
                left = middle + 1
            }
        }
        return right + 1
    }
}

let solution = Solution()
print(solution.searchInsert([1,3,5,6], 5))
print(solution.searchInsert([1,3,5,6], 2))
print(solution.searchInsert([1,3,5,6], 7))
print(solution.searchInsert([1,3,5,6], 0))
