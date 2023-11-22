import Foundation
/// **376. 摆动序列**
/// 如果连续数字之间的差严格地在正数和负数之间交替，则数字序列称为摆动序列 。
/// 第一个差（如果存在的话）可能是正数或负数。仅有一个元素或者含两个不等元素的序列也视作摆动序列。
/// 例如， [1, 7, 4, 9, 2, 5] 是一个 摆动序列 ，因为差值 (6, -3, 5, -7, 3) 是正负交替出现的。
/// 相反，[1, 4, 7, 2, 5] 和 [1, 7, 4, 5, 5] 不是摆动序列，第一个序列是因为它的前两个差值都是正数，第二个序列是因为它的最后一个差值为零。
/// **子序列**可以通过从原始序列中删除一些（也可以不删除）元素来获得，剩下的元素保持其原始顺序。
///
/// 给你一个整数数组 nums ，返回 nums 中作为**摆动序列**的**最长子序列的长度**。
///
/// **示例 1**
/// 输入：nums = [1,7,4,9,2,5]
/// 输出：6
/// 解释：整个序列均为摆动序列，各元素之间的差值为 (6, -3, 5, -7, 3) 。
class Solution {
    func wiggleMaxLength(_ nums: [Int]) -> Int {
        let N: Int = nums.count
        if N < 2 { return N }
        /// `dp`的定义以及递推
        ///     - `upDP[i]`表示前`i`个元素的最长的「上升摆动序列」的长度。
        ///     - `downDP[i]`表示前第`i`个元素的最长的「下降摆动序列」的长度。
        ///     - `downDP[0] = 0`, `downDP[1] = 1`, `upDP[0] = 0`, `upDP[1] = 1`
        var upDP: [Int] = Array(repeating: 1, count: N + 1)
        var downDP: [Int] = Array(repeating: 1, count: N + 1)
        for i in 2...N {
            if nums[i-1] > nums[i-2] {
                upDP[i] = max(upDP[i-1], downDP[i-1] + 1)
                downDP[i] = downDP[i-1]
            } else if nums[i-1] < nums[i-2] {
                downDP[i] = max(downDP[i-1], upDP[i-1] + 1)
                upDP[i] = upDP[i-1]
            } else {
                downDP[i] = downDP[i-1]
                upDP[i] = upDP[i-1]
            }
        }
        return max(downDP[N], upDP[N])
    }
}

let solution = Solution()
print(solution.wiggleMaxLength([1,7,4,9,2,5]))                          // 6
print(solution.wiggleMaxLength([1,17,5,10,13,15,10,5,16,8]))            // 7
print(solution.wiggleMaxLength([1,2,3,4,5,6,7,8,9]))                    // 2
