import Foundation
/// **907. 子数组的最小值之和**
/// 给定一个整数数组 `arr`，找到 `min(b)` 的总和，
/// 其中 `b` 的范围为 `arr` 的每个（连续）子数组。
/// 由于答案可能很大，因此 返回答案模 `10^9 + 7`。
class Solution1 {
    private let MOD: Int = Int(1e9 + 7)
    
    func sumSubarrayMins(_ arr: [Int]) -> Int {
        /// 解题思路：求数组中当前元素 x 左边第一个小于 x 的元素以及右边第一个小于等于 x 的元素
        var dict: [Int: [Int]] = [:]
        for index in 0..<arr.count {
            let left: [Int] = findLeftLessThan(arr, index)
            let right: [Int] = findRightLessThan(arr, index)
            dict[index, default: []].append(contentsOf: (left.isEmpty ? [-1] : left) + [index] + (right.isEmpty ? [arr.count] : right))
        }
        
        var result: Int = 0
        for (key, value) in dict {
            for index in 1..<value.count-1 {
                let count = (value[index] - value[index-1]) * (value[index+1] - value[index])
                result = (result + arr[key]*count) % MOD
            }
        }
        
        return result
    }
    
    func findLeftLessThan(
        _ arr: [Int],
        _ index: Int
    ) -> [Int] {
        for id in (0..<index).reversed() {
            if arr[index] > arr[id] {
                return [id]
            }
        }
        return []
    }
    
    func findRightLessThan(
        _ arr: [Int],
        _ index: Int
    ) -> [Int] {
        for id in (index+1)..<arr.count {
            if arr[index] >= arr[id] {
                return [id]
            }
        }
        return []
    }
}


class Solution {
    private let MOD: Int = Int(1e9 + 7)
    
    func sumSubarrayMins(_ arr: [Int]) -> Int {
        let left: [Int: Int] = self.formerLessThan(arr)
        let right: [Int: Int] = self.nextLessThan(arr)
        var result: Int = 0
        for id in 0..<arr.count {
            result = (result + arr[id]*left[id]!*right[id]!) % MOD
        }
        return result
    }
    
    // 寻找每一个元素右边不大于它的第一个元素
    func nextLessThan(_ nums: [Int]) -> [Int: Int] {
        var stack: [Int] = []
        /// `dict`的`key`表示当前元素的索引，`value`表示到右边不大于它的第一个元素的距离
        var dict: [Int: Int] = [:]
        for id in (0..<nums.count).reversed() {
            while !stack.isEmpty && nums[stack.last!] > nums[id] {
                stack.removeLast()
            }
            dict[id] = (stack.isEmpty ? nums.count : stack.last!) - id
            stack.append(id)
        }
        return dict
    }
    
    // 寻找每一个元素左边小于它的第一个元素
    func formerLessThan(_ nums: [Int]) -> [Int: Int] {
        var stack: [Int] = []
        var dict: [Int: Int] = [:]
        for id in 0..<nums.count {
            while !stack.isEmpty && nums[stack.last!] >= nums[id] {
                stack.removeLast()
            }
            dict[id] = id - (stack.isEmpty ? -1 : stack.last!)
            stack.append(id)
        }
        return dict
    }
}

let solution = Solution()
print(solution.sumSubarrayMins([3,1,2,4]))                // 17
print(solution.sumSubarrayMins([11,81,94,43,3]))          // 444
print(solution.sumSubarrayMins([1,1]))                    // 3
print(solution.sumSubarrayMins([71,55,82,55]))            // 593
