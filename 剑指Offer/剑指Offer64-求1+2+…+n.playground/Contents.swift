import Foundation

class Solution {
    
    var res = 0
    
    /// 执行用时：8 ms
    /// 内存消耗：13.8 MB
    func sumNumsSolution1(_ n: Int) -> Int {
        (n > 1) && ((sumNumsSolution1(n - 1)) != 0)
        res += n
        return res
    }
    
    func sumNumsTest(_ n: Int) -> Int {
        var sum = 0
        for i in 0...n {
            sum += i
        }
        return sum
    }
    
    /// 执行用时：0 ms, 在所有 Swift 提交中击败了 100.00% 的用户
    /// 内存消耗：13.4 MB, 在所有 Swift 提交中击败了 87.10% 的用户
    func sumNums(_ n: Int) -> Int {
        return Array(1...n).reduce(0,+)
    }
}

let solution = Solution()
print(solution.sumNums(9) == solution.sumNumsTest(9))
