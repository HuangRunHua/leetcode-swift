import Foundation
/// **202. 快乐数**
/// 编写一个算法来判断一个数 n 是不是快乐数。
///「快乐数」 定义为：
/// 对于一个正整数，每一次将该数替换为它每个位置上的数字的平方和。
/// 然后重复这个过程直到这个数变为 1，也可能是无限循环但始终变不到 1。
/// 如果这个过程 结果为 1，那么这个数就是快乐数。
/// 如果 n 是 快乐数 就返回 true ；不是，则返回 false 。
///
/// **示例 1**
/// 输入：n = 19
/// 输出：true
/// 解释：
/// 1^2 + 9^2 = 82
/// 8^2 + 2^2 = 68
/// 6^2 + 8^2 = 100
/// 1^2 + 0^2 + 0^2 = 1
class Solution {
    func isHappy(_ n: Int) -> Bool {
        var _n: Int = n
        /// 存储曾经出现过的数
        var memory: Set<Int> = []
        /// 当_n变成1的时候跳出循环即找到快乐数了
        while _n != 1 {
            /// 计算当前_n的数字平方和
            _n = sumOfSquares(_n)
            /// 如果在该平方和曾经出现过则说明出现环了这个数一定不是快乐数
            if memory.contains(_n) { return false }
            /// 添加平方和
            else { memory.insert(_n) }
        }
        /// 能跳出循环到这说明必须是快乐数
        return true
    }
    
    /// 计算一个正整数n每个位置上的数字的平方和。
    /// - Parameter n: 1～Int范围内的任意数字。
    /// - Returns: 正整数n每个位置上的数字的平方和。
    private func sumOfSquares(_ n: Int) -> Int {
        var _n: Int = n
        var result: Int = 0
        while _n > 0 {
            let num = _n % 10
            result += (num*num)
            _n /= 10
        }
        return result
    }
}

let solution = Solution()
print(solution.isHappy(19))
print(solution.isHappy(2))
