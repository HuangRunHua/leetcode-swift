import UIKit

class Solution {
    /// 执行用时：124 ms, 在所有 Swift 提交中击败了 84.21% 的用户
    /// 内存消耗：17.5 MB, 在所有 Swift 提交中击败了 10.53% 的用户
    /// 通过测试用例：208 / 208
    func exchangeSolution(_ nums: [Int]) -> [Int] {
        var result: [Int] = []
        var evens: [Int] = []
        nums.forEach { num in
            if num % 2 == 0 {
                evens.append(num)
            } else {
                result.append(num)
            }
        }
        result.append(contentsOf: evens)
        return result
    }
    
    /// 执行用时：140 ms, 在所有 Swift 提交中击败了 38.60% 的用户
    /// 内存消耗：17.6 MB, 在所有 Swift 提交中击败了 8.77% 的用户
    /// 通过测试用例：208 / 208
    func exchangeSolution2(_ nums: [Int]) -> [Int] {
        let length = nums.count
        var odd: [Int] = []
        var even: [Int] = []
        for id in 0..<length {
            if id < length - 1 - id {
                if nums[id] % 2 == 0 {
                    even.append(nums[id])
                } else {
                    odd.append(nums[id])
                }
                if nums[length - 1 - id] % 2 == 0 {
                    even.append(nums[length - 1 - id])
                } else {
                    odd.append(nums[length - 1 - id])
                }
            } else if id == length - 1 - id {
                if nums[id] % 2 == 0 {
                    even.append(nums[id])
                } else {
                    odd.append(nums[id])
                }
            }
        }
        odd.append(contentsOf: even)
        return odd
    }
    
    /// 执行用时：128 ms, 在所有 Swift 提交中击败了 56.14% 的用户
    /// 内存消耗：17 MB, 在所有 Swift 提交中击败了 45.61% 的用户
    /// 通过测试用例：208 / 208
    func exchange(_ nums: [Int]) -> [Int] {
        let length = nums.count - 1
        var nums_ = nums
        var i = 0
        var j = length
        while (i < j) {
            while (i < j) && nums_[i] % 2 == 1 { i += 1 }
            while (i < j) && nums_[j] % 2 == 0 { j -= 1 }
            (nums_[i], nums_[j]) = (nums_[j], nums_[i])
        }
        return nums_
    }
}

let solution = Solution()
var result = solution.exchange([1,2,3,4])
print(result)
