import Foundation
/// **1876. 长度为三且各字符不同的子字符串**
/// 如果一个字符串不含有任何重复字符，我们称这个字符串为**好字符串**。
/// 给你一个字符串s，请你返回s中**长度为3**的**好子字符串**的数量。
/// 注意，如果相同的好子字符串出现多次，每一次都应该被记入答案之中。
/// **子字符串:**是一个字符串中连续的字符序列。
///
/// **示例**
/// 输入：s = "xyzzaz"
/// 输出：1
/// 解释：总共有 4 个长度为 3 的子字符串："xyz"，"yzz"，"zza" 和 "zaz" 。
/// 唯一的长度为 3 的好子字符串是 "xyz" 。
class Solution {
    func countGoodSubstrings(_ s: String) -> Int {
        /// 将s转为Array方便索引同时加快运行速度
        let sList: [Character] = Array(s)
        /// 最终好字符串的数量
        var res: Int = 0
        /// 窗口的左边界、右边界与窗口内不同字符的个数
        var (left, right, valid) = (0, 0, 0)
        /// 哈希表，用于整理窗口内字符的数量，key为字符，value为字符出现的次数
        var hashMap: [Character: Int] = [:]
        
        while right < sList.count {
            let insertChar = sList[right]
            right += 1
            /// 更新窗口内字符出现的次数
            hashMap[insertChar, default: 0] += 1
            /// 只在字符第一次出现的时候更新valid
            /// 后续若再次出现相同字符则不更新valid防止重复
            if hashMap[insertChar] == 1 { valid += 1 }
            /// 窗口收缩的条件
            while right - left >= 3 {
                /// 当形成一个完整的窗口之后，判断内部字符是否都是独一无二的，即判断valid是否为3
                if valid == 3 { res += 1 }
                /// 窗口移动的时候待删除的字符
                let popChar = sList[left]
                left += 1
                /// 更新字符出现的次数
                hashMap[popChar, default: 0] -= 1
                /// 如果字符不再出现于窗口内，则需要进行valid更新
                if hashMap[popChar] == 0 {
                    hashMap.removeValue(forKey: popChar)
                    valid -= 1
                }
            }
        }
        return res
    }
}

let solution = Solution()
print(solution.countGoodSubstrings("xyzzaz"))
print(solution.countGoodSubstrings("aababcabc"))
print(solution.countGoodSubstrings("aba"))

