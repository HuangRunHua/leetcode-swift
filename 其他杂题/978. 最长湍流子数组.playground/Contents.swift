import Foundation
/// **978. 最长湍流子数组**
/// 给定一个整数数组arr ，返回arr的**最大湍流子数组的长度**。
/// 如果比较符号在子数组中的每个相邻元素对之间翻转，则该子数组是**湍流子数组**。
///
/// 示例 1：
/// 输入：arr = [9,4,2,10,7,8,8,1,9]
/// 输出：5
/// 解释：arr[1] > arr[2] < arr[3] > arr[4] < arr[5]
class Solution {
    /// 采用动态规划的思想
    /// 1.确认状态:
    ///     - 状态: 数组的长度会发生变化
    /// 2.确认dp的含义等信息:
    ///     - dp的维度: 一维，长度为assistArr的大小+1
    ///     - dp[i]的含义: 以第i-1个元素assistArr[i-1]结尾的时候最大子数组的长度
    ///     - dp[0] = 0, dp[1] = 1
    ///     - dp[i] = dp[i-1] + 1 当上一个元素符号与上上个元素符号相反或dp[i] = 1
    func maxTurbulenceSize(_ arr: [Int]) -> Int {
        /// 设置一个数组用于存放arr数组前后元素的比较符号
        /// 在此处使用0表示等于，1表示大于，-1表示小于
        var assistArr: [Int] = []
        for id in 0..<arr.count-1 {
            if arr[id] - arr[id+1] > 0 { assistArr.append(1) }
            else if arr[id] - arr[id+1] == 0 { assistArr.append(0) }
            else { assistArr.append(-1) }
        }
        /// 在变换之后问题变成了寻找assistArr中最长连续符号相反的子数组的长度
        // MARK: dp模板写法
        let N = assistArr.count
        /// N为0表示原先arr数组中只有一个元素，此时直接返回即可
        if N == 0 { return 1 }
        /// 声明dp数组
        var dp: [Int] = Array(repeating: 0, count: N+1)
        for i in 1...N {
            /// assistArr[i-1]为0表示arr数组中前后元素相同此时不需要给dp赋值只需要默认的0即可
            /// 否则可能会在return的时候多返回一个，分析[100,100]即可得到
            if assistArr[i-1] == 0 { continue }
            /// 确保assistArr[i-1]不为0之后，说明arr数组中前后元素不相同
            /// 此时判断是否为dp的第一个元素，如果是直接赋值1即可，后续return的时候确保了+1，分析[100,101]即可得到
            else if i == 1 { dp[i] = 1 }
            else {
                /// 当上一个元素符号与上上个元素符号相反的时候，即1 -1 或-1 1，此时dp[i] = dp[i-1] + 1
                if assistArr[i-1] != assistArr[i-2] && assistArr[i-2] != 0 { dp[i] = dp[i-1] + 1 }
                /// 当上一个元素符号与上上个元素符号相同的时候，即1 1 或-1 -1，此时dp[i] = 1
                else { dp[i] = 1 }
            }
        }
        /// 注意返回值需要加上 1
        return dp.max()! + 1
    }
}

let solution = Solution()
print(solution.maxTurbulenceSize([9,4,2,10,7,8,8,1,9])) // 5
print(solution.maxTurbulenceSize([4,8,12,16]))          // 2
print(solution.maxTurbulenceSize([100]))                // 1
print(solution.maxTurbulenceSize([100, 100, 100]))      // 1
print(solution.maxTurbulenceSize([4,5]))                // 2
print(solution.maxTurbulenceSize([100,100,101]))        // 2
