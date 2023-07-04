import Foundation

class Solution {
    
    func printBoundNumber(_ matrix: [[Int]],
                          startRow: Int,
                          endRow: Int,
                          startColumn: Int,
                          endColumn: Int, result: inout [Int]) -> [Int] {
        if startRow > endRow - 1 {
            /// 说明是单行
            if startColumn <= endColumn - 1 {
                for id_column in startColumn..<endColumn {
                    result.append(matrix[startRow-1][id_column])
                }
            }
        } else if startColumn >= endColumn - 1 {
            /// 说明是单列
            /// 外围矩形右侧一列
            if startRow <= endRow - 1 {
                for id_row in startRow-1..<endRow {
                    result.append(matrix[id_row][endColumn-1])
                }
            }
        } else {
            /// 先找到外围的几个元素
            /// 外围矩形第一行
            if startColumn <= endColumn - 1 {
                for id_column in startColumn..<endColumn {
                    result.append(matrix[startRow-1][id_column])
                }
            }
            
            /// 外围矩形右侧一列
            if startRow <= endRow - 1 {
                for id_row in startRow..<endRow {
                    result.append(matrix[id_row][endColumn-1])
                }
            }
            
            /// 外围矩形最后一行
            if startColumn <= endColumn - 1 {
                for id_column in (startColumn..<endColumn-1).reversed() {
                    result.append(matrix[endRow-1][id_column])
                }
            }
            
            /// 外围矩形左侧一列
            if startRow <= endRow - 1 {
                for id_row in (startRow..<endRow-1).reversed() {
                    result.append(matrix[id_row][startColumn])
                }
            }
        }
        return []
    }
    
    func spiralOrderSolution1(_ matrix: [[Int]]) -> [Int] {
        var result: [Int] = []
        /// 获取行列数目
        let row: Int = matrix.count
        let column: Int = matrix.first?.count ?? 0
        
        var startRow = 1
        var endRow = row
        var startColumn = 0
        var endColumn = column
        while (startRow <= endRow) && (startColumn < endColumn) {
            printBoundNumber(matrix,
                             startRow: startRow,
                             endRow: endRow,
                             startColumn: startColumn,
                             endColumn: endColumn,
                             result: &result)
            startRow += 1
            endRow -= 1
            startColumn += 1
            endColumn -= 1
        }
        return result
    }
    
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        if matrix.isEmpty {
            return []
        }
        
        var result: [Int] = []
        /// 获取行列数目
        var left: Int = 0
        var right: Int = matrix.first!.count-1
        var top: Int = 0
        var bottom: Int = matrix.count-1
        
        while true {
            for i in left...right {
                print("matrix[\(top)][\(i)] = \(matrix[top][i])")
                result.append(matrix[top][i])
            }
            top += 1
            if top > bottom { break }
            
            for j in top...bottom {
                print("matrix[\(right)][\(j)] = \(matrix[j][right])")
                result.append(matrix[j][right])
            }
            right -= 1
            if right < left { break }
            
            for k in (left...right).reversed() {
                print("matrix[\(bottom)][\(k)] = \(matrix[bottom][k])")
                result.append(matrix[bottom][k])
            }
            bottom -= 1
            if top > bottom { break }
            
            for l in (top...bottom).reversed() {
                print("matrix[\(l)][\(left)] = \(matrix[l][left])")
                result.append(matrix[l][left])
            }
            left += 1
            if right < left { break }
        }
        return result
    }
}

let solution = Solution()
print(solution.spiralOrder([[1,2,3],[4,5,6],[7,8,9]]))
print(solution.spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]]))
print(solution.spiralOrder([[1,2,3],[12,13,4],[11,14,5],[10,15,6],[9,8,7]]))
print(solution.spiralOrder([[1,2,3]]))
print(solution.spiralOrder([[1],[2],[3]]))
print(solution.spiralOrder([[1]]))
