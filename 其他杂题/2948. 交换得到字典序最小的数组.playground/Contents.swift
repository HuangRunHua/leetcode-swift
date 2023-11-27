import Foundation
/// **2948. 交换得到字典序最小的数组**
/// 给你一个下标从 0 开始的 正整数 数组 nums 和一个 正整数 limit 。
/// 在一次操作中，你可以选择任意两个下标 i 和 j，如果满足 `|nums[i] - nums[j]| <= limit`，
/// 则交换 `nums[i]` 和 `nums[j]` 。
/// 返回执行任意次操作后能得到的 字典序最小的数组 。
///
/// 如果在数组 a 和数组 b 第一个不同的位置上，数组 a 中的对应字符比数组 b 中的对应字符的字典序更小，
/// 则认为数组 a 就比数组 b 字典序更小。例如，数组 `[2,10,3]` 比数组 `[10,2,3]` 字典序更小，
/// 下标 0 处是两个数组第一个不同的位置，且 `2 < 10`。
class Solution {
    typealias Pair = (index: Int, num: Int)
    
    func lexicographicallySmallestArray(_ nums: [Int], _ limit: Int) -> [Int] {
        let N: Int = nums.count
        let pairedNums: [Pair] = generatePair(nums).sorted(by: { $0.num < $1.num })
        var result: [Int] = Array(repeating: 0, count: N)
        
        /// **分组循环**
        /// 外层循环：准备工作
        /// 内层循环：寻找最长的连续段的末尾位置
        var id: Int = 0
        while id < N {
            /// 记录每一组的开始位置
            let start: Int = id
            id += 1
            while id < N && pairedNums[id].num - pairedNums[id-1].num <= limit {
                /// 相邻两个元素的元素值均小于`limit`，此时说明是连通的，因此不做任何操作。
                id += 1
            }
            /// 运行到此处说明从`start`到`id-1`均属于连续段
            /// 且连续段内部相邻的两个元素的数字差小于等于`limit`。
            /// 此时需要提取出从`start`到`id-1`内的元素的下标并排序
            /// 此时可以得到同一组内可以填入的所有位置，再将同一组内所有的数字按从小到大添加到最终的结果中即可。
            let indics = pairedNums[start..<id].sorted(by: { $0.index < $1.index })
            for (j, num) in zip(indics, pairedNums[start..<id]) {
                result[j.index] = num.num
            }
        }
        return result
    }
    
    private func generatePair(_ nums: [Int]) -> [Pair] {
        var results: [Pair] = []
        for (index, num) in nums.enumerated() {
            results.append(Pair(index, num))
        }
        return results
    }
}

let solution = Solution()
print(solution.lexicographicallySmallestArray([1,5,3,9,8], 2))     // [1,3,5,8,9]
print(solution.lexicographicallySmallestArray([1,7,6,18,2,1], 3))  // [1,6,7,18,1,2]
