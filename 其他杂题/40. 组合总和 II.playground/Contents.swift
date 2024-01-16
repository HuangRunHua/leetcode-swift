import Foundation
/// **40. 组合总和 II**
/// 给定一个候选人编号的集合 `candidates` 和一个目标数 `target`，
/// 找出 `candidates` 中所有可以使数字和为 `target` 的组合。
/// `candidates`中的每个数字在每个组合中只能使用**一次**。
///
/// **注意：解集不能包含重复的组合。**
/// 题目链接：https://leetcode.cn/problems/combination-sum-ii/description/
class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        /// 如果总和小于target则直接返回空
        let candidates: [Int] = candidates.sorted()
        var current: [Int] = []
        var results: [[Int]] = []
        var visited: [Bool] = Array(repeating: false, count: candidates.count)
        var currentSum: Int = 0
        backtrack(candidates, &current, target, &results, &visited, &currentSum, 0)
        return results
    }
    
    func backtrack(
        _ candidates: [Int], _ current: inout [Int],
        _ target: Int, _ results: inout [[Int]],
        _ visited: inout [Bool], _ currentSum: inout Int, _ currentIndex: Int
    ) {
        if currentSum == target {
            results.append(current)
            return
        }
        if currentSum > target { return }
        
        for id in currentIndex..<candidates.count {
            /// 防止添加重复元素
            if id > currentIndex && candidates[id] == candidates[id-1] { continue }
            if !visited[id] {
                visited[id] = true
                current.append(candidates[id])
                currentSum += candidates[id]
                backtrack(candidates, &current, target, &results, &visited, &currentSum, id + 1)
                currentSum -= candidates[id]
                current.removeLast()
                visited[id] = false
            }
        }
    }
}

let solution = Solution()
/// `[[1, 1, 6], [1, 2, 5], [1, 7], [2, 6]]`
print(solution.combinationSum2([10,1,2,7,6,1,5], 8))
/// `[[1, 2, 2], [5]]`
print(solution.combinationSum2([2,5,2,1,2], 5))
/// `[]`
print(solution.combinationSum2([2], 1))
/// `[]`
print(solution.combinationSum2([1,2], 4))
/// `[[1, 1, 1, 5], [1, 1, 3, 3], [3, 5]]`
print(solution.combinationSum2([3,1,3,5,1,1], 8))

