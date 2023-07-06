import Foundation

class Solution {
    /// 执行用时：0 ms, 在所有 Swift 提交中击败了 100.00% 的用户
    /// 内存消耗：13.4 MB, 在所有 Swift 提交中击败了 46.15% 的用户
    /// 通过测试用例：51 / 51
    /// 原理: `a+b = (a^b) + (a&b)<<1`
    func add(_ a: Int, _ b: Int) -> Int {
        var _a = a
        var _b = b
        /// 当进位为 0 时跳出
        while (_b != 0) {
            /// c = 进位
            let c = (_a & _b) << 1
            _a ^= _b
            _b = c
        }
        return _a
    }
}

let solution = Solution()
print(solution.add(2, 4))
print(solution.add(5, 1))

//public int add(int a, int b) {
//        while(b != 0) { // 当进位为 0 时跳出
//            int c = (a & b) << 1;  // c = 进位
//            a ^= b; // a = 非进位和
//            b = c; // b = 进位
//        }
//        return a;
//    }
