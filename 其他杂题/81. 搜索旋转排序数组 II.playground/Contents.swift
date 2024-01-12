import Foundation
/// **81. 搜索旋转排序数组 II**
/// 已知存在一个按非降序排列的整数数组 `nums` ，数组中的值不必互不相同。
/// 给你 旋转后 的数组 `nums` 和一个整数 `target` ，请你编写一个函数来判断给定的目标值是否存在于数组中。
/// 如果 `nums` 中存在这个目标值 `target` ，则返回 `true` ，否则返回 `false` 。
/// 你必须尽可能减少整个操作步骤。
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        let gapIndex = self.searchGap(nums)
        return binarySearch(nums, target, 0, gapIndex-1) || binarySearch(nums, target, gapIndex, nums.count-1)
    }
    
    func binarySearch(_ nums: [Int], _ target: Int, _ left: Int, _ right: Int) -> Bool {
        if nums.isEmpty { return false }
        var (left, right) = (left, right)
        while left <= right {
            let mid = left + (right-left)/2
            if target == nums[mid] {
                return true
            } else if target > nums[mid] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return false
    }
    
    /// 寻找数组中的断层
    func searchGap(_ nums: [Int]) -> Int {
        var (left, right) = (0, nums.count-1)
        while left < right {
            let mid = left + (right-left)/2
            if nums[mid] > nums[right] {
                left = mid + 1
            } else if nums[mid] < nums[right] {
                right = mid
            } else {
                // 不确定旋转点方向，分情况进行left++或者right--
                if(nums[right-1] <= nums[right]) {
                    // right前一位 <= right当前位置值，说明旋转点一定在right前面
                    right -= 1
                } else {
                     // right位置就是旋转点
                    left = right;
                }
            }
        }
        return right
    }
}

let solution = Solution()
print(solution.search([2,5,6,0,0,1,2], 0))   // true
print(solution.search([2,5,6,0,0,1,2], 3))   // false
print(solution.search([1,2,3,4,4,4,5,6], 4))   // true
print(solution.search([4,4,5,6,1,2,3,4], 4))   // true
print(solution.search([1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1,1,1], 2))   // true
print(solution.search([1,0,1,1,1], 0))   // true

//let ref = 10.81
//let predict = 4.33
//print((ref-predict)/ref*100)
