import Foundation
/// **283. 移动零**
/// 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
/// 请注意 ，必须在不复制数组的情况下原地对数组进行操作。
/// 
/// 示例 1:
/// 输入: nums = [0,1,0,3,12]
/// 输出: [1,3,12,0,0]
class Solution {
    /// 使用双指针，左指针指向当前已经处理好的序列的尾部，右指针指向待处理序列的头部。
    /// 右指针不断向右移动，每次右指针指向非零数，则将左右指针对应的数交换，同时左指针右移。
    func moveZeroes(_ nums: inout [Int]) {
        var (left, right) = (0, 0)
        while right < nums.count {
            if nums[right] != 0 {
                nums.swapAt(left, right)
                left += 1
            }
            right += 1
        }
    }
}

let solution = Solution()
var array = [0,1,0,3,12]
solution.moveZeroes(&array)
print(array)
