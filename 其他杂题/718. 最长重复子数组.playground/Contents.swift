import Foundation
/// **718. 最长重复子数组**
/// 给两个整数数组nums1和nums2，返回两个数组中**公共的长度最长的**子数组的长度 。
///
/// **示例 1**
/// 输入：nums1 = [1,2,3,2,1], nums2 = [3,2,1,4,7]
/// 输出：3
/// 解释：长度最长的公共子数组是 [3,2,1]。
class Solution {
    /// 采用动态规划的思想
    /// dp的含义
    ///     - dp的维度: 二维，W表示数组1的大小，H表示数组2的大小
    ///     - dp[i][j]的含义: 以nums1第i个元素与nums2第j个元素结尾的最长公共前缀的大小，因此最终结果为dp中数值最大
    ///     - dp[0][j] = dp[i][0] = 0
    ///     - dp[i][j] = dp[i-1][j-1] + 1 如果nums1[i-1] == nums2[j-1] 否则为0
    func findLength(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let (W, H) = (nums1.count, nums2.count)
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: H+1), count: W+1)
        /// 从二维数组dp中找最大值比较不方便，采用maxLength去存储即可
        var maxLength: Int = 0
        for i in 1...W {
            for j in 1...H {
                if nums1[i-1] == nums2[j-1] {
                    dp[i][j] = dp[i-1][j-1] + 1
                } else {
                    dp[i][j] = 0
                }
                maxLength = max(maxLength, dp[i][j])
            }
        }
        return maxLength
    }
}

let solution = Solution()
print(solution.findLength([1,2,3,2,1], [3,2,1,4,7]))
print(solution.findLength([0,0,0,0,0], [0,0,0,0,0]))
