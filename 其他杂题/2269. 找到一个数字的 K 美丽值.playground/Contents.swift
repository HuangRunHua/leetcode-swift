import Foundation
/// **2269. 找到一个数字的 K 美丽值**
/// 一个整数 num 的 k 美丽值定义为 num 中符合以下条件的**子字符串**数目：
///     - 子字符串长度为 k 。
///     - 子字符串能整除 num 。
/// 给你整数 num 和 k ，请你返回 num 的 k 美丽值。
///
/// **注意**
/// - 允许有 前缀 0 。
/// - 0 不能整除任何值。
/// - 一个 子字符串 是一个字符串里的连续一段字符序列。
///
/// **示例 1*
/// 输入：num = 240, k = 2
/// 输出：2
/// 解释：以下是 num 里长度为 k 的子字符串：
/// - "240" 中的 "24" ：24 能整除 240 。
/// - "240" 中的 "40" ：40 能整除 240 。
/// 所以，k 美丽值为 2 。
class Solution {
    func divisorSubstrings(_ num: Int, _ k: Int) -> Int {
        let numsList: [Int] = self.convertNum(from: num)
        var (left, right) = (0, 0)
        var windows: [Int] = []
        var result: Int = 0
        while right < numsList.count {
            let insertNum = numsList[right]
            right += 1
            windows.append(insertNum)
            
            while right - left >= k {
                let curNum = self.convertArray(from: windows)
                if (curNum != 0) && (num % curNum == 0) { result += 1 }
                
                windows.removeFirst()
                left += 1
            }
        }
        return result
    }
    
    /// 将数字转为数组
    private func convertNum(from num: Int) -> [Int] {
        var result: [Int] = []
        var _num = num
        while _num > 0 {
            result.insert(_num % 10, at: 0)
            _num /= 10
        }
        return result
    }
    
    /// 将数组转为数字
    private func convertArray(from nums: [Int]) -> Int {
        var res: Int = 0
        var id: Int = 0
        while id < nums.count {
            res += customPow(10, nums.count - id - 1) * nums[id]
            id += 1
        }
        return res
    }
    
    private func customPow(_ a: Int, _ n: Int) -> Int {
        var res: Int = 1
        var (_a, _n) = (a, n)
        while _n > 0 {
            if _n % 2 == 1 { res *= _a }
            _a *= _a
            _n >>= 1
        }
        return res
    }
}

let solution = Solution()
print(solution.divisorSubstrings(240, 2))
print(solution.divisorSubstrings(430043, 2))
