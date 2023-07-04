import Foundation

class Solution {
    /// 执行用时：0 ms, 在所有 Swift 提交中击败了 100.00% 的用户
    /// 内存消耗：13.3 MB, 在所有 Swift 提交中击败了 72.09% 的用户
    /// 通过测试用例：51 / 51
    func fibSolution1(_ n: Int) -> Int {
        if n < 2 {
            return n
        }
        var a = 0
        var b = 1
        
        for _ in 0..<n-1 {
            (a, b) = (b, (a + b) % 1000000007)
        }
        return b
    }
    
    
    /// 执行用时：0 ms, 在所有 Swift 提交中击败了 100.00% 的用户
    /// 内存消耗：13.5 MB, 在所有 Swift 提交中击败了 27.91% 的用户
    /// 通过测试用例：51 / 51
    func fib(_ n: Int) -> Int {
        if n < 2 {
            return n
        }
        let result = matrixPow([[1,1], [1,0]], n: n-1-1)
        return result[0][0]
    }
    
    /// 快速幂算法
    func matrixPow(_ matrix: [[Int]], n: Int) -> [[Int]] {
        var _matrix = matrix
        var _n = n
        var result = [[1,1], [1,0]]
        while _n > 0 {
            /// 判断n的奇偶性，&为按位与运算符
            /// 如果是奇数则需要多乘一次矩阵
            if (_n & 1 == 1) {
                result = multiply(a: result, b: _matrix)
            }
            _n >>= 1
            _matrix = multiply(a: _matrix, b: _matrix)
        }
        return result
    }
    
    func multiply(a: [[Int]], b: [[Int]]) -> [[Int]] {
        var c = [[0,0], [0,0]]
        for i in 0..<2 {
            for j in 0..<2 {
                c[i][j] = (a[i][0] * b[0][j] + a[i][1] * b[1][j]) % 1000000007
            }
        }
        return c
    }
}

let s = Solution()
print(s.fib(2))
