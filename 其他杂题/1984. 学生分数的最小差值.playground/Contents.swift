import Foundation
/// **1984. 学生分数的最小差值**
/// 给你一个 下标从 0 开始 的整数数组 nums ，其中 nums[i] 表示第 i 名学生的分数。另给你一个整数 k 。
/// 从数组中选出任意 k 名学生的分数，使这 k 个分数间**最高分**和**最低分**的**差值**达到**最小化**。
/// 返回可能的 最小差值 。
///
/// **示例 1**
/// 输入：nums = [90], k = 1
/// 输出：0
/// 解释：选出 1 名学生的分数，仅有 1 种方法：
/// - [90] 最高分和最低分之间的差值是 90 - 90 = 0
/// 可能的最小差值是 0
class Solution {
    func minimumDifference(_ nums: [Int], _ k: Int) -> Int {
        if k == 1 { return 0 }
        /// 要想最小化选择的k名学生中最高分和最低分的差值
        /// 一定是在排好序后的数组中连续地进行选择。
        let _nums: [Int] = nums.sorted(by: { $0 < $1 })
        var result: Int = Int.max
        var (left, right) = (0, 0)
        while right < _nums.count {
            let insertNum = _nums[right]
            right += 1
            
            while right - left >= k {
                let diff = insertNum - _nums[left]
                if diff < result { result = diff }
                left += 1
            }
        }
        return result
    }
}

let solution = Solution()
print(solution.minimumDifference([90], 1))
print(solution.minimumDifference([9,4,1,7], 2))
print(solution.minimumDifference([87063,61094,44530,21297,95857,93551,9918], 6))
