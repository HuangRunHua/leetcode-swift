import Foundation
/// **2379. 得到 K 个黑块的最少涂色次数**
/// 给你一个长度为 n 下标从 0 开始的字符串 blocks ，
/// blocks[i] 要么是 'W' 要么是 'B'，表示第 i 块的颜色。
/// 字符 'W' 和 'B' 分别表示白色和黑色。
/// 给你一个整数 k ，表示想要**连续黑色块的数目**。
/// 每一次操作中，你可以选择一个白色块将它 涂成 黑色块。
/// 请你返回至少出现**一次**连续 k 个黑色块的**最少**操作次数。
///
/// **示例 1**
/// 输入：blocks = "WBBWWBBWBW", k = 7
/// 输出：3
/// 解释：
/// 一种得到 7 个连续黑色块的方法是把第 0 ，3 和 4 个块涂成黑色。
/// 得到 blocks = "BBBBBBBWBW" 。
class Solution {
    /// 我们用一个固定大小为 k 的「滑动窗口」表示出现连续 k 个黑色块的区间，我们需要将该区间全部变为黑色块，
    /// 此时我们需要的操作次数为该区间中白色块的数目，那么我们只需要在「滑动窗口」从左向右移动的过程中
    /// 记录窗口中黑色块的数目`blackCount`，则需要的涂色次数为`k-blackCount`.
    func minimumRecolors(_ blocks: String, _ k: Int) -> Int {
        let blockList: [Character] = Array(blocks)
        /// 滑动窗口左边界、右边界、记录滑动窗口内黑色块的个数、记录最终的结果
        var (left, right, blackCount, result) = (0, 0, 0, Int.max)
        while right < blockList.count {
            // MARK: 更新右边界
            let insertBlock = blockList[right]
            right += 1
            /// 如果遇到黑色块则更新 blackCount
            if insertBlock == Character("W") { blackCount += 1 }
            /// 窗口需要收缩
            while right - left >= k {
                /// 如果黑色的数目比k小，则更新涂色次数
                if blackCount < k { result = min(result, k-blackCount) }
                /// 如果黑色的数目比k大，显然不用再涂色了
                else { result = 0 }
                // MARK: 更新左边界
                let popBlock = blockList[left]
                if popBlock == Character("B") { blackCount -= 1 }
                left += 1
            }
        }
        return result
    }
}

let solution = Solution()
print(solution.minimumRecolors("WBBWWBBWBW", 7))
print(solution.minimumRecolors("WBWBBBW", 2))


