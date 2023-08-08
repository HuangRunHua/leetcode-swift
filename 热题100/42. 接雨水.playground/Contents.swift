import Foundation
/// **42. 接雨水**
/// 给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。
class Solution {
    /// 核心思想: 当前索引处能接到的雨水量 = min(左边最大高度, 右边最大高度) - 当前索引值的高度
    func trap(_ height: [Int]) -> Int {
        var result: Int = 0
        /// 使用双指针一个用于更新左边的最高高度，一个用于更新右边的最高高度
        var (left, right) = (0, height.count-1)
        /// 存储左边与右边的最高高度
        var (leftMax, rightMax): (Int, Int) = (0, 0)
        while left < right {
            /// 判断左边与右边的高度
            if height[left] < height[right] {
                /// 此时更新左边的最大高度并计算left处的雨水量
                /// 不计算right处的雨水量是由于right处左边的最高高度未知，只是已知了右边的最高高度
                /// 计算left处的雨水量是由于已知了left处的高度小于right处的高度，而从一开始的时候就根据两者的值进行判断
                /// 因此无论什么情况均有leftMax小于rightMax所以可以计算
                leftMax = max(leftMax, height[left])
                result += (leftMax - height[left])
                left += 1
            } else {
                /// 此时更新右边的最大高度并计算right处的雨水量
                rightMax = max(rightMax, height[right])
                result += (rightMax - height[right])
                right -= 1
            }
        }
        return result
    }
}

let solution = Solution()
print(solution.trap([0,1,0,2,1,0,1,3,2,1,2,1]))
