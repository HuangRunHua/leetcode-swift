import Foundation
/// 剑指 Offer 62. 圆圈中最后剩下的数字
/// 0,1,···,n-1这n个数字排成一个圆圈，从数字0开始，
/// 每次从这个圆圈里删除第m个数字（删除后从下一个数字开始计数）。
/// 求出这个圆圈里剩下的最后一个数字。
///
/// 例如，0、1、2、3、4这5个数字组成一个圆圈，从数字0开始每次删除
/// 第3个数字，则删除的前4个数字依次是2、0、4、1，因此最后剩下的数字是3。
class Solution {
    /// 执行用时：4 ms, 在所有 Swift 提交中击败了 85.71% 的用户
    /// 内存消耗：13.1 MB, 在所有 Swift 提交中击败了 100.00% 的用户
    /// 通过测试用例：36 / 36
    func lastRemaining(_ n: Int, _ m: Int) -> Int {
        var res: Int = 0
        for i in 2...n {
            ///  f(n) = (f(n-1) + m) % n
            res = (res + m) % i
        }
        return res
    }
}

let solution = Solution()
/// 3
print(solution.lastRemaining(5, 3))
/// 2
print(solution.lastRemaining(10, 17))
