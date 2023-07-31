import Foundation

class ShellSort {
    func shellSort(_ nums: inout [Int]) {
        /// 设置初始增量
        var gap = nums.count / 2
        while gap > 0 {
            /// 对每一个增量，从gap开始对对应间隔的子数组进行插入排序
            for i in gap..<nums.count {
                /// 待插入的位置
                var j = i
                /// 在子树组中对应的间隔内进行插入排序
                while j >= gap && nums[j - gap] > nums[j] {
                    /// 移动元素
                    nums.swapAt(j, j-gap)
                    j -= gap
                }
            }
            /// 缩小增量
            gap /= 2
        }
    }
}

