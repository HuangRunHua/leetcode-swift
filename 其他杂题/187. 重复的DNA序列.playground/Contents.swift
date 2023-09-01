import Foundation
/// **187. 重复的DNA序列**
/// DNA序列 由一系列核苷酸组成，缩写为 'A', 'C', 'G' 和 'T'.。
/// 例如，"ACGAATTCCG" 是一个 DNA序列 。
/// 在研究 DNA 时，识别 DNA 中的重复序列非常有用。
///
/// 给定一个表示 DNA序列 的字符串 s ，返回所有在 DNA 分子中出现不止一次的**长度为10**的序列(子字符串)。你可以按**任意顺序**返回答案。
///
/// 示例 1：
/// 输入：s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
/// 输出：["AAAAACCCCC","CCCCCAAAAA"]
/// 示例 2：
/// 输入：s = "AAAAAAAAAAAAA"
/// 输出：["AAAAAAAAAA"]
class Solution1 {
    var hashMap: [String: Int] = [:]
    /// Solution 1的解法类似30. 串联所有单词的子串
    /// 外层循环遍历10次，内层的滑动窗口一次移动10个步长
    /// 最终结果采用哈希表的方式存储
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        self.hashMap = [:]
        let _s: [Character] = Array(s)
        for index in 0..<10 {
            slideWindow(_s, index, index)
        }
        return Array(hashMap.filter({ $0.value > 1 }).keys)
    }
    private func slideWindow(_ s: [Character], _ left: Int, _ right: Int) {
        var (l, r) = (left, right)
        while r <= s.count-10 {
            let nextStr = String(s[r..<r+10])
            r += 10
            hashMap[nextStr, default: 0] += 1
            l += 10
        }
    }
}

class Solution2 {
    var hashMap: [String: Int] = [:]
    var res: [String] = []
    /// 方法2一次只移动一个字符的长度，将所有的数据全都用哈希表进行存储
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        self.hashMap = [:]
        self.res = []
        let _s: [Character] = Array(s)
        slideWindow(_s)
        return res
    }
    private func slideWindow(_ s: [Character]) {
        var (l, r) = (0, 0)
        while r <= s.count-10 {
            let nextStr = String(s[r..<r+10])
            r += 1
            hashMap[nextStr, default: 0] += 1
            l += 1
            /// 防止重复添加的步骤
            if hashMap[nextStr] == 2 { res.append(nextStr) }
        }
    }
}

class Solution {
    private let windowLength: Int = 10
    private let DNADict: [Character: Int] = [
        Character("A"): 0, // 00
        Character("C"): 1, // 01
        Character("T"): 2, // 10
        Character("G"): 3  // 11
    ]
    /// **方法三: 哈希表+滑动窗口+位运算**
    /// 注意一个Character最小占用的空间为1个字节，如果采用哈希表来存储
    /// 10个Character至少占用10个字节。
    /// **注意到ACTG只有四种因此实际上采用两个bit就可以存储一个字符**
    /// **10个字符理论上需要的内存空间为20个bit，采用一个Int就可以存储**
    /// 此时采用哈希表来存储就节省了大量的空间。
    ///
    /// 问题由此转化为如何求取10个字符对应的整数表示。用一个**大小固定为10的滑动窗口**来计算子串的整数表示。
    /// 设当前滑动窗口对应的整数表示为x，当我们要计算下一个子串时，就将滑动窗口向右移动一位，
    /// 此时会有一个新的字符进入窗口，以及窗口最左边的字符离开窗口，这些操作对应的**位运算**
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        let _s: [Character] = Array(s)
        return slideWindow(_s)
    }
    private func slideWindow(_ s: [Character]) -> [String] {
        var results: [String] = []
        var window: [Int: Int] = [:]
        /// 用来计算滑动窗口代表的整数值
        var num: Int = 0
        /// 滑动窗口的左右边界
        var (left, right) = (0, 0)
        while right < s.count {
            /// 即将插入的字符
            let inserChar = s[right]
            right += 1
            /// 针对右边多出来的字符更新窗口中的数据
            /// 一次移动两个bit位因为每一个字符是两位bit
            num = (num << 2) | DNADict[inserChar]!
            /// 窗口需要收缩
            while right - left >= windowLength {
                /// 由于num在上述先添加了新的字符，导致刚进收缩循环的时候长度大于实际需要的长度
                /// 如果这个时候先更新哈希表会出现错误，因此需要先更新移动出去的字符
                num &= ((1 << (windowLength*2)) - 1)
                /// 更新哈希表
                window[num, default: 0] += 1
                /// 防止多次写入相同的序列
                if window[num] == 2 {
                    results.append(String(s[left..<right]))
                }
                /// 更新窗口的左边界
                left += 1
            }
        }
        return results
    }
}


let solution = Solution()
print(solution.findRepeatedDnaSequences("AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"))
print(solution.findRepeatedDnaSequences("AAAAAAAAAAA"))




