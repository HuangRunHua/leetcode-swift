import Foundation
/// **39. 组合总和**
/// 给你一个**无重复元素**的整数数组`candidates`和一个目标整数`target`，
/// 找出`candidates`中可以使数字和为目标数`target`的**所有**不同组合 ，并以列表形式返回。你可以按**任意顺序**返回这些组合。
/// `candidates`中的**同一个**数字可以**无限制重复被选取**。如果至少一个数字的被选数量不同，则两种组合是不同的。
/// 对于给定的输入，保证和为 `target` 的不同组合数少于 `150` 个。
class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var current: [Int] = []
        var results: Set<[Int]> = []
        backtrack(candidates, &current, target, &results)
        return Array(results)
    }
    
    func backtrack(
        _ candidates: [Int], _ current: inout [Int],
        _ target: Int, _ results: inout Set<[Int]>
    ) {
        let currentSum: Int = current.reduce(0, +)
        if currentSum == target {
            results.insert(current.sorted())
            return
        }
        if currentSum > target { return }
        
        for candidate in candidates {
            current.append(candidate)
            backtrack(candidates, &current, target, &results)
            current.removeLast()
        }
    }
}

let solution = Solution()
/// `[[2,2,3],[7]]`
print(solution.combinationSum([2,3,6,7], 7))
/// `[[2,2,2,2],[2,3,3],[3,5]]`
print(solution.combinationSum([2,3,5], 8))
/// `[]`
print(solution.combinationSum([2], 1))

