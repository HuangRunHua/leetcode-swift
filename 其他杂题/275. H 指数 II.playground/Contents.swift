import Foundation
/// **275. H 指数 II**
/// 给你一个整数数组 citations ，其中 citations[i] 表示研究者的第 i 篇论文被引用的次数，
/// citations 已经按照 升序排列 。计算并返回该研究者的 h 指数。
/// h 指数的定义：h 代表“高引用次数”（high citations），
/// 一名科研人员的 h 指数是指他（她）的 （n 篇论文中）至少 有 h 篇论文分别被引用了至少 h 次。
/// 请你设计并实现对数时间复杂度的算法解决此问题。
///
/// **示例 1：**
/// 输入：citations = [0,1,3,5,6]
/// 输出：3
/// 解释：给定数组表示研究者总共有 5 篇论文，每篇论文相应的被引用了 0, 1, 3, 5, 6 次。
///     由于研究者有3篇论文每篇 至少 被引用了 3 次，其余两篇论文每篇被引用 不多于 3 次，所以她的 h 指数是 3 。
/// **示例 2：**
/// 输入：citations = [1,2,100]
/// 输出：2
class Solution {
    func hIndex1(_ citations: [Int]) -> Int {
        let N: Int = citations.count
        var result: Int = 0
        for index in 0..<N {
            if citations[N-index-1] > index {
                result = max(result, index + 1)
            }
        }
        return result
    }
    
    func hIndex(_ citations: [Int]) -> Int {
        let N: Int = citations.count
        var (left, right) = (0, N-1)
        while left <= right {
            let mid = left + (right - left)/2
            if citations[mid] >= N - mid {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return N - left
    }
}

let solution = Solution()
print(solution.hIndex([0,1,3,5,6])) // 3
print(solution.hIndex([1,2,100]))   // 2
