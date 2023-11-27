import Foundation
/// **907. 子数组的最小值之和**
/// 给定一个整数数组 `arr`，找到 `min(b)` 的总和，
/// 其中 `b` 的范围为 `arr` 的每个（连续）子数组。
/// 由于答案可能很大，因此 返回答案模 `10^9 + 7`。
class Solution {
    func sumSubarrayMins(_ arr: [Int]) -> Int {
        /// 解题思路：对每一个元素在左边和右边分别寻找比它小的第一个数
        var dict: [Int: [Int]] = [:]
        for index in 0..<arr.count {
            let left: [Int] = findLeftLessThan(arr, index)
            let right: [Int] = findRightLessThan(arr, index)
            dict[index, default: []].append(contentsOf: (left.isEmpty ? [-1] : left) + [index] + (right.isEmpty ? [arr.count] : right))
        }
        
        print("dict = \(dict)")
        
        var result: Int = 0
        for (key, value) in dict {
            for index in 1..<value.count-1 {
//                print("cur = \(arr[index])")
                let count = (value[index] - value[index-1]) * (value[index+1] - value[index])
//                print("count = \(count)")
                result += (arr[key]*count)
            }
        }
        
        return result
    }
    
    func findLeftLessThan(
        _ arr: [Int],
        _ index: Int
    ) -> [Int] {
        for id in (0..<index).reversed() {
            if arr[index] >= arr[id] {
                return [id]
            }
        }
        return []
    }
    
    func findRightLessThan(
        _ arr: [Int],
        _ index: Int
    ) -> [Int] {
        for id in (index+1)..<arr.count {
            if arr[index] >= arr[id] {
                return [id]
            }
        }
        return []
    }
}

let solution = Solution()
//print(solution.sumSubarrayMins([3,1,2,4]))                // 17
//print(solution.sumSubarrayMins([11,81,94,43,3]))          // 444
print(solution.sumSubarrayMins([1,1]))                    // 3
//print(solution.sumSubarrayMins([71,55,82,55]))              // 593
