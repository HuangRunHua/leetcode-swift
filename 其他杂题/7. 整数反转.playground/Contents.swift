import Foundation
/// **7. 整数反转**
/// 给你一个 `32` 位的有符号整数 `x` ，返回将 `x` 中的数字部分反转后的结果。
/// 如果反转后整数超过 `32` 位的有符号整数的范围 `[−2^31,  2^31 − 1]` ，就返回 `0`。
/// 假设环境不允许存储 `64` 位整数（有符号或无符号）。
class Solution {
    private let maxNum: Int32 = Int32.max
    private let minNum: Int32 = Int32.min
    
    func reverse(_ x: Int) -> Int {
        var res: Int32 = 0
        var x: Int32 = Int32(x)
        while (x != 0) {
            if res > maxNum/10 || res < minNum/10 {
                return 0
            }
            let digit: Int32 = x % 10
            x /= 10
            res = res*10 + digit
        }
        return Int(res)
    }
}

let solution = Solution()
print(solution.reverse(-123))
print(solution.reverse(120))
print(solution.reverse(123))
print(solution.reverse(2147483647))
print(solution.reverse(-2147483648))
print(solution.reverse(-1563847412))



