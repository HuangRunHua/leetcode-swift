import Foundation
/// **1004. 最大连续1的个数 III**
/// 给定一个二进制数组nums和一个整数k，如果可以翻转最多**k**个0 ，则返回**数组中连续1**的最大个数 。
///
/// **示例 1**
/// 输入：nums = [1,1,1,0,0,0,1,1,1,1,0], K = 2
/// 输出：6
/// 解释：[1,1,1,0,0,1,1,1,1,1,1]
class Solution {
    func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        var (left, right) = (0, 0)
        /// 前left元素的前缀和，前right元素的前缀和
        /// 为了方便计算0的个数，将里面的数字0变为1，1变为0来计算累加和
        var (lsum, rsum) = (0, 0)
        var result: Int = 0
        // MARK: 滑动窗口
        while right < nums.count {
            // MARK: 右边无脑滑动
            let insertNum = nums[right]
            right += 1
            /// 同时更新右前缀和
            rsum += (1 - insertNum)
            // MARK: 窗口收缩
            /// 左边滑动的条件为当窗口内的0元素大于k个的时候，此时不能再添加0了
            /// 只能`>k`是由于如果设置为`>=k`，则当窗口内0的个数等于k的时候左边界与左前缀和会在while里面被更新
            /// 导致最后的比较结果部分缺少**窗口内0的个数等于k**个时候的情况，因此只能过一部分示例，这一部分示例满足:
            /// 只需要翻转少于k个0就可以得到最大长度的情况。若示例中最长的情况是需要翻转的个数等于k个时候就没有办法通过。
            while rsum - lsum > k {
                // MARK: 更新左指针并更新左前缀和
                let popNum = nums[left]
                lsum += (1 - popNum)
                left += 1
            }
            // MARK: 比较获取最终的结果
            /// 此处result的更新放在最后是因为:
            ///     1. 放在`while rsum - lsum > k {...}` 内部的话那么
            ///         只有当0元素个数大于k的时候才会更新一次和题目中最多k个0矛盾，因为有些时候不需要k个0就可以取得最大长度
            ///     2. 放在`while rsum - lsum > k {...}` 上面的话那么有可能窗口内的0元素超过k个，因为right是无脑滑动的
            result = max(result, right - left)
        }
        return result
    }
}

let solution = Solution()
print(solution.longestOnes([1,1,1,0,0,0,1,1,1,1,0], 2)) // 6
print(solution.longestOnes([0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], 3)) // 10
print(solution.longestOnes([0,0,0,1], 4)) // 4
