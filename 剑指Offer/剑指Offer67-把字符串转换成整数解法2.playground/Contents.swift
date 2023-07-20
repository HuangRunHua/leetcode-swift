import Foundation
/// 剑指 Offer 67. 把字符串转换成整数 (**解法二: 有限状态自由机**)
/// 写一个函数 StrToInt，实现把字符串转换成整数这个功能。不能使用 atoi 或者其他类似的库函数。
/// 首先，该函数会根据需要丢弃无用的开头空格字符，直到寻找到第一个非空格的字符为止。
/// 当我们寻找到的第一个非空字符为正或者负号时，则将该符号与之后面尽可能多的连续数字组合起来，
/// 作为该整数的正负号；假如第一个非空字符是数字，则直接将其与之后连续的数字字符组合起来，形成整数。
/// 该字符串除了有效的整数部分之后也可能会存在多余的字符，这些字符可以被忽略，它们对于函数不应该造成影响。
/// 注意：假如该字符串中的第一个非空格字符不是一个有效整数字符、字符串为空或字符串仅包含空白字符时，则你的函数不需要进行转换。
/// 在任何情况下，若函数不能进行有效的转换时，请返回 0。
/// 说明：
/// 假设我们的环境只能存储 32 位大小的有符号整数，那么其数值范围为 [−231,  231 − 1]。
/// 如果数值超过这个范围，请返回  INT_MAX (231 − 1) 或 INT_MIN (−231) 。
class Solution {
    enum Input {
        /// 空格输入
        case spacer
        /// 正负号输入
        case sign
        /// 数字输入 0
        case zeroNumber
        /// 数字输入 1-9
        case nonZeroNumber
        /// 其他输入视为非法输入
        case illegal
    }
    
    enum State {
        /// 首空格的情况
        case initState
        /// 符号
        case signState
        /// 输入一直为0的状态
        case zeroNumberState
        /// 输入开始不是0的状态
        case nonZeroNumberState
        /// 末尾的空格
        case endState
    }
    
    private let transitionRules: [State: [Input: State]] = [
        .initState: [
            .spacer: .initState,
            .sign: .signState,
            .zeroNumber: .zeroNumberState,
            .nonZeroNumber: .nonZeroNumberState
        ],
        .signState: [
            .zeroNumber: .zeroNumberState,
            .nonZeroNumber: .nonZeroNumberState
        ],
        .nonZeroNumberState: [
            .nonZeroNumber: .nonZeroNumberState,
            .zeroNumber: .nonZeroNumberState,
            .spacer: .endState
        ],
        .zeroNumberState: [
            .zeroNumber: .zeroNumberState,
            .nonZeroNumber: .nonZeroNumberState
        ]
    ]
    
    func strToInt(_ str: String) -> Int {
        var numStrList: [String] = []
        var beginingState: State = .initState
        for c in str {
            let inputs = transitionToInputs(from: c)
            if let nextState = transitionRules[beginingState]?[inputs] {
                if nextState == .nonZeroNumberState {
                    /// 当出现前面数字中有非 0 字符后可以添加 0 字符了
                    if inputs == .nonZeroNumber || inputs == .zeroNumber { numStrList.append(String(c)) }
                } else {
                    /// 如果开始的字符为 0 则不添加该字符，直到第一个非 0 字符的出现才开始添加
                    if inputs == .nonZeroNumber || inputs == .sign { numStrList.append(String(c)) }
                }
                beginingState = nextState
            } else {
                /// 无法找到下一个状态说明无法转为整数
                break
            }
        }
        return strListToInt(numStrList)
    }
    
    private func transitionToInputs(from input: Character) -> Input {
        if input == Character(" ") { return .spacer }
        else if input.isNumber && input == Character("0") { return .zeroNumber }
        else if input.isNumber && input != Character("0") { return .nonZeroNumber }
        else if "+-".contains(input) { return .sign }
        else { return .illegal }
    }
    
    private func strListToInt(_ strList: [String]) -> Int {
        /// strlist 可能的形式包括如下几种
        /// ["4", "2"], ["-", "4", "2"], [], ["-"], ["+"]
        /// 因此需要处理空表与含有单一正负号的情况
        if strList.isEmpty { return 0 }
        if strList.count == 1 {
            if "+-".contains(strList.first!) { return 0 }
            else { return Int(strList.first!) ?? 0 }
        }
        let (_strList, mark) = removeMark(strList)
        /// 防止类似 "20000000000000000000" 字符串的出现
        if _strList.count > 10 {
            return mark < 0 ? Int(Int32.min): Int(Int32.max)
        }
        var res: Int = 0
        var length: Int = 1
        for num in _strList.reversed() {
            if let numInt = Int(num) {
                if (Int(Int32.max) - res) < numInt * self.powerToTen(length-1) {
                    return mark < 0 ? Int(Int32.min) : Int(Int32.max)
                } else {
                    res += numInt * self.powerToTen(length-1)
                    length += 1
                }
            }
        }
        return mark < 0 ? 0-res: res
    }
    
    private func removeMark(_ strList: [String]) -> (strList: [String], mark: Int) {
        if strList[0] == "-" { return (Array(strList.dropFirst()), -1) }
        else if strList[0] == "+" { return (Array(strList.dropFirst()), 1) }
        else { return (strList, 1) }
    }
    
    private func powerToTen(_ n: Int) -> Int {
        var res: Int = 1
        var _n = n
        while _n != 0 { res *= 10; _n -= 1 }
        return res
    }
}

let solution = Solution()
print(solution.strToInt("42"))
print(solution.strToInt("       -42"))
print(solution.strToInt("4193 with words"))
print(solution.strToInt("words and 987"))
print(solution.strToInt("-words and 987"))
print(solution.strToInt("-41093 with words"))
print(solution.strToInt("-4193- with words"))
print(solution.strToInt("-91283472332"))
print(solution.strToInt("00123456780"))
print(solution.strToInt("20000000000000000000"))
print(solution.strToInt("-2147483647"))
print(solution.strToInt("0-1"))

