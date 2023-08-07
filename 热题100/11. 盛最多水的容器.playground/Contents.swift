//
//  main.swift
//  11. 盛最多水的容器
//
//  Created by Huang Runhua on 8/7/23.
//

import Foundation
/// **11. 盛最多水的容器**
/// `给定一个长度为n的整数数组 height。
/// `有n条垂线，第i条线的两个端点是(i, 0)和(i, height[i])。`
/// 找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
/// 返回容器可以储存的最大水量。
class Solution {
    /// **核心思想**：初始化双指针分列水槽左右两端，循环每轮将短板向内移动一格，
    /// 并更新面积最大值，直到两指针相遇时跳出；即可获得最大面积。
    func maxArea(_ height: [Int]) -> Int {
        var (left, right) = (0, height.count-1)
        var res: Int = 0
        while left < right {
            res = max(min(height[left], height[right]) * (right - left), res)
            height[left] < height[right] ? (left += 1) : (right -= 1)
        }
        return res
    }
}

let solution = Solution()
print(solution.maxArea([1,8,6,2,5,4,8,3,7])) // 49

