import Foundation

class Solution {
    enum Inputs {
        /// 空格 `<SPACER>`
        case space
        /// 数字 0-9
        case number
        /// 符号位 +-
        case sign
        /// 小数点 .
        case point
        /// 幂符号 eE
        case exp
        /// 非法输入
        case illegal
    }
    
    enum State {
        /// 起始的空格
        case initState
        /// 符号位
        case signState
        /// 整数部分
        case integerState
        /// 左侧有整数的小数点
        case pointWithLeftNumberState
        /// 左侧无整数的小数点
        case pointWithoutLeftNumberState
        /// 小数部分
        case fractionState
        /// 指数字符 eE
        case expState
        /// 指数部分的符号位
        case expSignState
        /// 指数部分的整数部分
        case expIntegerState
        /// 末尾的空格
        case endState
    }
    
    /// 定义所有的状态转移规则
    /// 状态转移规则通常是一个哈希表Table 1，表的键表示可能的所有 State，表的值也是一个哈希表Table 2.
    /// Table 2的键表示所有合法的输入，Table 2的值当输入合法输入后转移到的下一个状态
    private let transitionRules: [State: [Inputs: State]] = [
        .initState: [
            .space: .initState,
            .number: .integerState,
            .sign: .signState,
            .point: .pointWithoutLeftNumberState
        ],
        .signState: [
            .number: .integerState,
            .point: .pointWithoutLeftNumberState
        ],
        .integerState: [
            .number: .integerState,
            .point: .pointWithLeftNumberState,
            .exp: .expState,
            .space: .endState
        ],
        .pointWithLeftNumberState: [
            .space: .endState,
            .number: .fractionState,
            .exp: .expState
        ],
        .pointWithoutLeftNumberState: [
            .number: .fractionState
        ],
        .fractionState: [
            .space: .endState,
            .number: .fractionState,
            .exp: .expState
        ],
        .expState: [
            .number: .expIntegerState,
            .sign: .expSignState
        ],
        .expSignState: [
            .number: .expIntegerState
        ],
        .expIntegerState: [
            .number: .expIntegerState,
            .space: .endState
        ],
        .endState: [
            .space: .endState
        ]
    ]
    
    func isNumber(_ s: String) -> Bool {
        var beginingState: State = .initState
        for c in s {
            let inputType = transitionToInputs(from: c)
            if let nextState = transitionRules[beginingState]?[inputType] {
                beginingState = nextState
            } else {
                return false
            }
        }
        return [State.integerState, State.pointWithLeftNumberState, State.fractionState, State.expIntegerState, State.endState].contains(beginingState)
    }
    
    
    /// 输入内容转为对应可识别的输入枚举类型
    /// - Parameter char: 每次输入的字符
    /// - Returns: 输入对应的枚举类型
    private func transitionToInputs(from char: Character) -> Inputs {
        if char.isNumber { return .number }
        else if char == Character(" ") { return .space }
        else if "+-".contains(char) { return .sign }
        else if char == Character(".") { return .point }
        else if "eE".contains(char) { return .exp }
        else { return .illegal }
    }
}

let solution = Solution()
print(solution.isNumber("-1E-16"))
//print(solution.isNumber("+100"))
//print(solution.isNumber("5e2"))
//print(solution.isNumber("-123"))
//print(solution.isNumber("3.1416"))
//print(solution.isNumber("  -1E-16   "))
//print(solution.isNumber("  -1E-16"))
//print(solution.isNumber("-1E-16"))
//print(solution.isNumber("    .1  "))
//print(solution.isNumber("0123"))
//print(solution.isNumber("12e"))
//print(solution.isNumber("1a3.14"))
//print(solution.isNumber("12e+5.4"))
//print(solution.isNumber("+-5"))
