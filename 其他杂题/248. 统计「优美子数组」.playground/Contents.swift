import Foundation
/// **248. 统计「优美子数组」**
/// 给你一个整数数组nums和一个整数k。如果某个连续子数组中恰好有k个**奇数**数字，我们就认为这个子数组是「优美子数组」。
/// 请返回这个数组中 「优美子数组」 的数目。
///
/// **示例 1**
/// 输入：nums = [1,1,2,1,1], k = 3
/// 输出：2
/// 解释：包含3个奇数的子数组是[1,1,2,1] 和 [1,2,1,1] 。
class Solution {
    func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
        var (left, right) = (0, 0)
        /// 统计最终的优美子数组的个数
        var result: Int = 0
        /// 统计滑动窗口内奇数的个数
        var oddCount: Int = 0
        while right < nums.count {
            let insertNum = nums[right]
            right += 1
            
            if insertNum % 2 == 1 {
                oddCount += 1
            }
            
            while (oddCount >= k) {
                // MARK: 统计优美子数组的个数
                /// 先将滑动窗口的右边界向右拓展，直到遇到下一个奇数/出界,用于统计第k个奇数右边的偶数的个数
                var tmp = right
                while (right < nums.count) && (nums[right] & 1 == 0) {
                    right += 1
                }
                /// 第k个奇数右边的偶数的个数
                let rightEvenCnt: Int = right - tmp
                /// 统计第 1 个奇数左边的偶数的个数
                var leftEvenCnt: Int = 0
                while (nums[left] & 1 == 0) {
                    leftEvenCnt += 1
                    left += 1
                }
                /// 第 1 个奇数左边的 leftEvenCnt 个偶数都可以作为优美子数组的起点
                /// (因为第1个奇数左边可以1个偶数都不取，所以起点的选择有 leftEvenCnt + 1 种）
                /// 第 k 个奇数右边的 rightEvenCnt 个偶数都可以作为优美子数组的终点
                /// (因为第k个奇数右边可以1个偶数都不取，所以终点的选择有 rightEvenCnt + 1 种）
                /// 所以该滑动窗口中，优美子数组左右起点的选择组合数为 (leftEvenCnt + 1) * (rightEvenCnt + 1)
                result += (leftEvenCnt + 1) * (rightEvenCnt + 1)
                
                /// 此时 left 指向的是第 1 个奇数，因为该区间已经统计完了，因此 left 右移一位，oddCnt--
                left += 1
                oddCount -= 1
            }
        }
        return result
    }
}

let solution = Solution()
print(solution.numberOfSubarrays([1,1,2,1,1], 3))   // 2
print(solution.numberOfSubarrays([2,4,6], 1))       // 0
print(solution.numberOfSubarrays([2,2,2,1,2,2,1,2,2,2], 2)) // 16
