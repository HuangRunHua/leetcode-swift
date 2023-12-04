import Foundation
/// **面试题 17.05. 字母与数字**
/// 给定一个放有字母和数字的数组，找到最长的子数组，且包含的字母和数字的个数相同。
/// 返回该子数组，若存在多个最长子数组，返回左端点下标值最小的子数组。
/// 若不存在这样的数组，返回一个空数组。
class Solution {
    func findLongestSubarray(_ array: [String]) -> [String] {
        // MARK: 基本思路
        /// 遇到字母的时候`+1`，遇到数字的时候`-1`，寻找和为`0`的一段子数组
        /// 也即寻找满足前缀和`psum[i-1] = psum[j]`的索引`i`与`j`
        ///
        /// `result`中`begin`表示最长子数组的起始索引，`length`表示子数组的长度
        var result: (begin: Int, length: Int) = (0,0)
        var presum: Int = 0
        /// 前缀和字典，`key`表示前缀和，`value`表示第一次出现的索引值
        var dict: [Int: Int] = [0: -1]
        for (id, char) in array.enumerated() {
            if Character(char).isLetter { presum += 1 }
            else if Character(char).isNumber { presum -= 1 }
            if let firstIndex = dict[presum] {
                if result.length < id - firstIndex {
                    /// 注意到前缀和相同的时候`P[i] = P[j]`并设`i < j`
                    /// 此时的子数组为从`i+1`到`j`因此`result`中`begin`为`firstIndex + 1`
                    result = (firstIndex + 1, id - firstIndex)
                }
            } else { dict[presum] = id }
        }
        /// 最终计算结果的时候注意起始虽然为`result.begin`
        /// 但是子数组的末尾应该是`result.begin+result.length-1`
        /// 例如起始索引为`0`，长度为`6`的数组的可索引范围为`[0, 5]`
        return result.length == 0 ? [] : Array(array[result.begin..<result.begin+result.length])
    }
}

let solution = Solution()
/// `["A","1","B","C","D","2","3","4","E","5","F","G","6","7"]`
print(solution.findLongestSubarray(["A","1","B","C","D","2","3","4","E","5","F","G","6","7","H","I","J","K","L","M"]))
///  `[]`
print(solution.findLongestSubarray(["A","A"]))
/// `["A","1"]`
print(solution.findLongestSubarray(["A","1"]))
