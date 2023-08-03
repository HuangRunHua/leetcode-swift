import Foundation
/// **118. 杨辉三角**
/// 给定一个非负整数 numRows，生成「杨辉三角」的前 numRows 行。
/// **在「杨辉三角」中，每个数是它左上方和右上方的数的和。**
class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var results: [[Int]] = []
        for row in 1..<numRows+1 {
            var current_row: [Int] = []
            for id in 1..<row+1 {
                // 计算第row行的时候需要确保有row-1行元素
                if results.count == row - 1 {
                    // 除去头尾的两个数可以通过上一行的两数相加得到结果
                    if (id > 1) && (id < row) {
                        current_row.append(results[row-2][id-2] + results[row-2][id-1])
                    } else {
                        current_row.append(1)
                    }
                }
            }
            results.append(current_row)
        }
        return results
    }
}

let solution = Solution()
print(solution.generate(1))
print(solution.generate(2))
print(solution.generate(3))
print(solution.generate(4))
print(solution.generate(5))
print(solution.generate(22))
print(solution.generate(30))
