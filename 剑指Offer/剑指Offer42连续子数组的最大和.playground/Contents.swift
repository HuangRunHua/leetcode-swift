//
//  main.swift
//  dynamic-something
//
//  Created by Huang Runhua on 8/11/23.
//

import Foundation

class Solution {
    /// 1. 确认状态与选择
    ///     - 状态: 数组的长度
    ///     - 选择: 选择/不选择该数值
    /// 2. 确认dp的基础信息
    ///     - dp的大小: dp[N+1], N表示数组的长度
    ///     - dp[i]的含义: **以自己为结尾**前i个元素组成的**连续子数组**的和的最大值，
    ///         注意**子数组与子串的概念不一样**，由于是连续的因此要求**必须以自己为结尾**
    ///     - dp[0]表示0个元素构成的最大值，默认为数组第一个元素即可，
    ///         dp[1]表示只由一个元素构成的最大值，显然为其本身
    ///         初始化dp的时候由于需要包含自身，因此初始化的时候dp[i]的值设置为nums[i-1]
    func maxSubArray(_ nums: [Int]) -> Int {
        let N = nums.count
        var dp: [Int] = nums
        /// 这段代码的存在是为了和动态规划模板相对应，方便理解
        /// 模板内一般dp的长度为N+1
        dp.insert(nums[0], at: 0)
        for i in 1...N {
            if i == 1 {
                dp[i] = nums[i-1]
            } else {
                /// 由于要求以自己为结尾，因此最大值要么是自己最大，要么就是加上前面几个数构成的最大值
                dp[i] = max(nums[i-1], dp[i-1] + nums[i-1])
                /// 下面这段代码实现了**非连续的子串的最大值**
                /// dp[i] = max(dp[i-1], dp[i-1] + nums[i-1])
            }
        }
        /// 注意dp的定义，由于dp[i]表示**以自己为结尾**前i个元素组成的**连续子数组**的和的最大值
        /// 因此有可能存在不以最后一个元素为结尾的最大值，因此需要返回dp内的最大值。
        return dp.max()!
    }
}

let solution = Solution()
print(solution.maxSubArray([1]))
print(solution.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))
print(solution.maxSubArray([1,2]))

