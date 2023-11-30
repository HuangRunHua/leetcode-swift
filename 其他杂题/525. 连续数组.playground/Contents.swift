import Foundation
/// **525. 连续数组**
/// 给定一个二进制数组`nums`, 找到含有相同数量的 `0` 和 `1` 的最长连续子数组，并返回该子数组的长度。
class Solution {
    func findMaxLength(_ nums: [Int]) -> Int {
        /// 前缀和字典，key表示前缀和，value表示首次出现的下标
        var dict: [Int:Int] = [0:-1]
        /// 当前的前缀和
        var presum: Int = 0
        /// 最终的结果
        var result: Int = Int.min
        for (id, num) in nums.enumerated() {
            /// 将问题转化为前缀和，遇到`0`则就减`1`，遇到`1`就加`1`，
            /// 则符合条件的子数组所有元素的和为`0`
            /// 则变为`P[i-1] = P[j]`问题
            presum += (num == 0 ? -1 : num)
            if let firstOccurIndex = dict[presum] {
                result = max(result, id - firstOccurIndex)
            } else {
                dict[presum] = id
            }
        }
        return result == Int.min ? 0 : result
    }
}

let solution = Solution()
//print(solution.findMaxLength([0,1]))     // 2
//print(solution.findMaxLength([0,1,0]))   // 2
print(solution.findMaxLength([1,1,1,1,1,1,1,1]))   // 2
