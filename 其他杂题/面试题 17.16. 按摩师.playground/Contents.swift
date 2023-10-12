import Foundation
/// **面试题 17.16. 按摩师**
/// 一个有名的按摩师会收到源源不断的预约请求，每个预约都可以选择接或不接。
/// 在每次预约服务之间要有休息时间，因此她不能接受相邻的预约。
/// 给定一个预约请求序列，替按摩师找到最优的预约集合（总预约时间最长），返回总的分钟数。
///
/// **示例 1**
/// 输入： [2,1,4,5,3,1,1,3]
/// 输出： 12
/// 解释： 选择 1 号预约、 3 号预约、 5 号预约和 8 号预约，总时长 = 2 + 4 + 3 + 3 = 12。
class Solution {
    func massage(_ nums: [Int]) -> Int {
        let N: Int = nums.count
        if N == 0 { return 0 }
        /// dp[i]表示前i号最长预约时间
        /// dp[0] = 0, dp[1] = nums[0]
        ///     - 不选择当前预约，则总的预约时间为前i-1号最长预约时间: dp[i] = dp[i-1]
        ///     - 选择当前预约，则总的预约时间为前i-2号最长预约时间加上当前的预约时间: dp[i] = dp[i-2] + nums[i-1]
        var dp: [Int] = Array(repeating: 0, count: N + 1)
        for i in 1...N {
            if i == 1 { dp[i] = nums[i-1] }
            else { dp[i] = max(dp[i-1], dp[i-2] + nums[i-1]) }
        }
        return dp[N]
    }
}

let solution = Solution()
print(solution.massage([1,2,3,1]))          // 4
print(solution.massage([2,7,9,3,1]))        // 12
print(solution.massage([2,1,4,5,3,1,1,3]))  // 12
