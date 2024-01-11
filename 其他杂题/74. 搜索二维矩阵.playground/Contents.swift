import Foundation
/// **74. 搜索二维矩阵**
/// 给你一个满足下述两条属性的`m x n`整数矩阵：
/// 每行中的整数从左到右按非严格递增顺序排列。
/// 每行的第一个整数大于前一行的最后一个整数。
/// 给你一个整数`target`，如果`target`在矩阵中，返回`true`；否则，返回`false`。
class Solution {
    func searchMatrixSolution1(_ matrix: [[Int]], _ target: Int) -> Bool {
        let (row, column) = (matrix.count, matrix[0].count)
        var (rowID, columnID) = (row-1, 0)
        while rowID >= 0 && columnID < column {
            if matrix[rowID][columnID] > target {
                rowID -= 1
            } else if matrix[rowID][columnID] < target {
                columnID += 1
            } else {
                return true
            }
        }
        return false
    }
    
    /// 将矩阵每一行拼接起来，构成一个递增的数组
    /// 再使用二分法寻找目标元素，需要映射left与right到矩阵行列中
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let (m, n) = (matrix.count, matrix[0].count)
        var (left, right) = (0, m*n-1)
        while left <= right {
            let mid = left + (right-left)/2
            if matrix[mid/n][mid%n] == target {
                return true
            } else if matrix[mid/n][mid%n] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return false
    }
}

let solution = Solution()
print(solution.searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3))    // true
print(solution.searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 13))   // false
