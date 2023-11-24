import Foundation
/// **496. 下一个更大元素 I**
/// `nums1` 中数字 `x` 的 下一个更大元素 是指 `x` 在 `nums2` 中对应位置 右侧 的 第一个 比 `x` 大的元素。
/// 给你两个 没有重复元素 的数组 `nums1` 和 `nums2` ，下标从 `0` 开始计数，其中`nums1` 是 `nums2` 的子集。
/// 对于每个 `0 <= i < nums1.length` ，找出满足 `nums1[i] == nums2[j]` 的下标 `j` ，
/// 并且在 `nums2` 确定 `nums2[j]` 的 下一个更大元素 。如果不存在下一个更大元素，那么本次查询的答案是 `-1` 。
/// 返回一个长度为 `nums1.length` 的数组 `ans` 作为答案，满足 `ans[i]` 是如上所述的 下一个更大元素 。
///
class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let nextDict: [Int: Int] = _nextElementSingleStack(nums2)
        var result: [Int] = []
        for num in nums1 {
            if let value = nextDict[num] {
                result.append(value)
            }
        }
        return result
    }
    
    private func _nextElement(_ nums: [Int]) -> [Int: Int] {
        var result: [Int: Int] = [:]
        var id: Int = 0
        while id < nums.count {
            result[nums[id]] = -1
            for index in id+1..<nums.count {
                if nums[index] > nums[id] {
                    result[nums[id]] = nums[index]
                    break
                }
            }
            id += 1
        }
        return result
    }
    
    private func _nextElementSingleStack(_ nums: [Int]) -> [Int: Int] {
        var result: [Int: Int] = [:]
        var stack: [Int] = []
        for num in nums.reversed() {
            while !stack.isEmpty && stack.last! <= num {
                stack.removeLast()
            }
            result[num] = stack.isEmpty ? -1 : stack.last!
            stack.append(num)
        }
        return result
    }
}

let solution = Solution()
print(solution.nextGreaterElement([4,1,2], [1,3,4,2]))
print(solution.nextGreaterElement([2,4],[1,2,3,4]))
