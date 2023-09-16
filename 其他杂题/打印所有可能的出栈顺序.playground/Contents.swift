import Foundation

class Solution {
    private var results: [[Int]] = []
    /// 打印所有可能的出栈结果
    func popResults(_ nums: [Int]) -> [[Int]] {
        self.results = []
        var (_nums, stack, popped): ([Int], [Int], [Int]) = (nums, [], [])
        getAllOutStackSeq(pushedNums: &_nums, n: _nums.count, stack: &stack, poppedNums: &popped)
        return self.results
    }
    
    /// 给定一个入栈顺序，使用回溯法打印所有可能的出栈结果。
    /// - Parameters:
    ///   - pushedNums: 所有准备入栈元素构成的数组
    ///   - n: 入栈元素的个数
    ///   - stack: 模拟元素入栈，用于存放选择的入栈元素
    ///   - poppedNums: 所有出栈元素构成的数组
    private func getAllOutStackSeq(pushedNums: inout [Int],
                           n: Int, stack: inout [Int],
                           poppedNums: inout [Int]) {
        if n <= 0 || (pushedNums.isEmpty && stack.isEmpty && poppedNums.isEmpty) { return }
        
        if poppedNums.count == n {
            results.append(poppedNums)
            return
        }
        /// 栈中有元素则可以模拟出栈
        /// 每一次模拟出栈有两种情况：
        ///     1. 出栈一个元素并入栈一个新的元素: 该情况是执行了`poppedNums.append` + `getAllOutStackSeq`
        ///         并在递归内部进入到`if !pushedNums.isEmpty`
        ///     2. 不出栈元素但继续入栈一个新元素: 该情况属于回溯法撤销选择后继续执行`if !pushedNums.isEmpty`
        if !stack.isEmpty {
            // MARK: 回溯法做选择
            /// 移除栈中最后一个元素并添加到出栈队列中
            let removedElement = stack.removeLast()
            poppedNums.append(removedElement)
            // MARK: 递归
            getAllOutStackSeq(pushedNums: &pushedNums, n: n, stack: &stack, poppedNums: &poppedNums)
            // MARK: 回溯法撤销选择
            /// 撤销选择表示不移除栈中最后一个元素，过渡到后续if结合起来就是添加新的元素到栈中
            stack.append(removedElement)
            poppedNums.removeLast()
        }
        
        if !pushedNums.isEmpty {
            // MARK: 回溯法做选择
            /// 按入栈的顺序添加每一个元素到栈中
            let removedElement = pushedNums.removeFirst()
            stack.append(removedElement)
            // MARK: 递归
            getAllOutStackSeq(pushedNums: &pushedNums, n: n, stack: &stack, poppedNums: &poppedNums)
            // MARK: 回溯法撤销选择
            pushedNums.insert(removedElement, at: 0)
            stack.removeLast()
        }
    }
}
