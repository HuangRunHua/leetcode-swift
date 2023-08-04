import Foundation
/// **128. 最长连续序列**
/// 给定一个未排序的整数数组 nums ，找出数字连续的最长序列（不要求序列元素在原数组中连续）的长度。
/// 请你设计并实现时间复杂度为 O(n) 的算法解决此问题。
///
/// 示例 1：
/// 输入：nums = [100,4,200,1,3,2]
/// 输出：4
/// 解释：最长数字连续序列是 [1, 2, 3, 4]。它的长度为 4。
/// 示例 2：
/// 输入：nums = [0,3,7,2,5,8,4,6,0,1]
/// 输出：9
class Solution {
    func longestConsecutiveSolution1(_ nums: [Int]) -> Int {
        /// 先去掉重复的元素
        var nums_set: Set<Int> = []
        for num in nums { nums_set.insert(num) }
        /// 存储最终的结果
        var res: Int = 0
        /// 遍历集合内元素
        for num in nums_set {
            /// 先判断比 num 小的数是否存在
            /// 若存在则表示必然在某一个时刻遍历过当前的数字，跳过此轮计算即可。
            if !nums_set.contains(num - 1) {
                var currNum = num
                /// 当前连续子串的程度
                var curLength: Int = 1
                /// 不断检查 cur + 1, cur + 2, ..., cur + k是否存在于集合中
                while nums_set.contains(currNum + 1) {
                    /// 找到则将计数结果 + 1
                    curLength += 1
                    /// 更新 curNum 用于结束 while 循环
                    currNum += 1
                }
                /// 比较上一个时刻的最大值与当前值子串的长度
                res = max(res, curLength)
            }
        }
        return res
    }
    func longestConsecutive(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        /// 先去掉重复的元素
        var nums_set: [Int] = Set(nums).sorted()
        /// 动态规划数组
        var dp: [Int] = Array(repeating: 0, count: nums_set.count)
        /// 一开始数组第一个元素为1
        dp[0] = 1
        for id in 1..<nums_set.count {
            /// 若数字连续则当前元素的子串长度 = 前一个元素的子串长度 + 1
            if nums_set[id] - nums_set[id-1] == 1 {
                dp[id] = dp[id-1] + 1
            } else {
                /// 若数字不连续则当前元素的子串长度 = 1即表示从头开始计数
                dp[id] = 1
            }
        }
        /// 返回动态规划数组内最大的值即可
        return dp.max() ?? 1
    }
}

let solution = Solution()
print(solution.longestConsecutive([100,4,200,1,3,2])) // 4
print(solution.longestConsecutive([0,3,7,2,5,8,4,6,0,1])) // 9
print(solution.longestConsecutive([9,1,4,7,3,-1,0,5,8,-1,6])) // 7
