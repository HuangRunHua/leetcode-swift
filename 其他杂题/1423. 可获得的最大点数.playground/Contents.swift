import Foundation
/// **1423. 可获得的最大点数**
/// 几张卡牌排成一行，每张卡牌都有一个对应的点数。点数由整数数组 `cardPoints` 给出。
/// 每次行动，你可以从行的开头或者末尾拿一张卡牌，最终你必须正好拿 `k` 张卡牌。
/// 你的点数就是你拿到手中的所有卡牌的点数之和。
/// 给你一个整数数组 `cardPoints` 和整数 `k`，请你返回可以获得的最大点数。
class Solution {
    func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
        var (left, right) = (0, 0)
        let (N, sum) = (cardPoints.count, cardPoints.reduce(0, +))
        if N == k { return sum }
        var windowSum: Int = 0
        var result: Int = Int.max
        while right < N {
            let insertNum = cardPoints[right]
            windowSum += insertNum
            right += 1
            
            while right - left >= (N - k) {
                result = min(result, windowSum)
                
                let popNum = cardPoints[left]
                windowSum -= popNum
                left += 1
            }
        }
        return sum - result
    }
}

let solution = Solution()
print(solution.maxScore([1,2,3,4,5,6,1], 3))         // 12
print(solution.maxScore([2,2,2], 2))                 // 4
print(solution.maxScore([9,7,7,9,7,7,9], 7))         // 55
print(solution.maxScore([1,1000,1], 1))              // 1
print(solution.maxScore([1,79,80,1,1,1,200,1], 3))   // 202
