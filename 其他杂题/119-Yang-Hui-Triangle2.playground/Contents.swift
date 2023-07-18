import Foundation

class Solution {
    // total: 4 ms
    func getRowSolution1(_ rowIndex: Int) -> [Int] {
        let num = rowIndex + 1
        var results: [[Int]] = []
        for row in 1..<num+1 {
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
        return results[rowIndex]
    }
    
    // total: 0 ms
    func getRow(_ rowIndex: Int) -> [Int] {
        let num = rowIndex + 1
        var results: [Int] = []
        for row in 1..<num+1 {
            var current_row: [Int] = []
            for id in 1..<row+1 {
                // 计算第row行的时候需要确保有row-1行元素
                if results.count == row - 1 {
                    // 除去头尾的两个数可以通过上一行的两数相加得到结果
                    if (id > 1) && (id < row) {
                        current_row.append(results[id-2] + results[id-1])
                    } else {
                        current_row.append(1)
                    }
                }
            }
            results = current_row
        }
        return results
    }
}

let solution = Solution()
print(solution.getRow(0))
print(solution.getRow(1))
print(solution.getRow(2))
print(solution.getRow(3))
print(solution.getRow(4))
print(solution.getRow(5))
print(solution.getRowSolution1(0))
print(solution.getRowSolution1(1))
print(solution.getRowSolution1(2))
print(solution.getRowSolution1(3))
print(solution.getRowSolution1(4))
print(solution.getRowSolution1(5))

