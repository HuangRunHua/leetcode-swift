import Foundation
// 6. Z 字形变换 https://leetcode.cn/problems/zigzag-conversion/description/
// 将一个给定字符串 s 根据给定的行数 numRows ，以从上往下、从左到右进行 Z 字形排列。
//
// 比如输入字符串为 "PAYPALISHIRING" 行数为 3 时，排列如下：
//
// P   A   H   N
// A P L S I I G
// Y   I   R
// 之后，你的输出需要从左往右逐行读取，产生出一个新的字符串，比如："PAHNAPLSIIGYIR"。
//
// 请你实现这个将字符串进行指定行数变换的函数：
//
// string convert(string s, int numRows);
//
//
// 示例 1：
//
// 输入：s = "PAYPALISHIRING", numRows = 3
// 输出："PAHNAPLSIIGYIR"
// 示例 2：
// 输入：s = "PAYPALISHIRING", numRows = 4
// 输出："PINALSIGYAHRPI"
// 解释：
// P     I    N
// A   L S  I G
// Y A   H R
// P     I
// 示例 3：
//
// 输入：s = "A", numRows = 1
// 输出："A"
class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        let sChar: [String] = s.map({ String($0) })
        let M: Int = sChar.count
        // 计算总列数
        let maxColumn: Int = getColumnIndex(m: M, n: numRows)
        var matrix: [[String]] = Array(repeating: Array(repeating: "", count: maxColumn+1), count: numRows)
        var result: String = ""
        for id in 1...sChar.count {
            let column = getColumnIndex(m: id, n: numRows)
            let row = getRowIndex(m: id, n: numRows)
            matrix[row][column] = sChar[id-1]
        }
        for row in matrix {
            result += row.reduce("", +)
        }
        return result
    }
    
    /// 计算第m个元素所在的列
    func getColumnIndex(m: Int, n: Int) -> Int {
        var id = 0
        let gap = 2*n-2
        if gap == 0 { return m-1 }
        while !((id*gap+1 <= m) && m < ((id+1)*gap+1)) {
            id += 1
        }
        // 第id轮的时候最小值为id*gap+1，同一列的最大值为id*gap+n-1
        // 如果m比id*gap+n-1还大，此时列数需要+m-(id*gap+n-1)
        if m >= (id*gap+1) && m <= (id*gap+n) {
            return (n-1)*(id)
        } else {
            return (n-1)*(id)+(m-((id*gap+n)))
        }
    }
    
    /// 计算第m个元素所在的行
    func getRowIndex(m: Int, n: Int) -> Int {
        var id = 0
        let gap = 2*n-2
        if gap == 0 { return 0 }
        while !((id*gap+1 <= m) && m < ((id+1)*gap+1)) {
            id += 1
        }
        if m >= (id*gap+1) && m <= (id*gap+n) {
            return m-(id*gap+1)
        } else {
            return n-1-(m-((id*gap+n)))
        }
    }
}

let solution = Solution()
// "PAHNAPLSIIGYIR"
print(solution.convert("PAYPALISHIRING", 3))
// "PINALSIGYAHRPI"
print(solution.convert("PAYPALISHIRING", 4))
print(solution.convert("A", 1))
