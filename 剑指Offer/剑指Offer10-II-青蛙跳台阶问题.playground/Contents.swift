import Foundation

class Solution {
    /// 执行用时：0 ms, 在所有 Swift 提交中击败了 100.00% 的用户
    /// 内存消耗：13.3 MB, 在所有 Swift 提交中击败了 72.09% 的用户
    /// 通过测试用例：51 / 51
    func numWays(_ n: Int) -> Int {
        if n < 1 { return 1 }
        let _MOD = 1000000007
        
        var a = 1
        var b = 1
        
        for _ in 0..<n-1 {
            (a, b) = (b, (a + b) % _MOD)
        }
        
        return b
    }
}

let s = Solution()
print(s.numWays(2))
print(s.numWays(7))
print(s.numWays(0))
print(s.numWays(50))
