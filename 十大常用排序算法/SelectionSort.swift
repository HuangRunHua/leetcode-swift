import Foundation

class SelectionSort {
    func selectionSort(_ nums: inout [Int]) {
        for i in 0..<nums.count {
            /// 假设该元素为最大值并记录其索引
            var temptMax: Int = i
            for j in i..<nums.count {
                /// 如果找到比当前最大值更大的元素，则将索引更新
                if nums[temptMax] < nums[j] {
                    temptMax = j
                }
            }
            /// 如果最大值不是起始的 i 则交换
            if i != temptMax { nums.swapAt(i, temptMax) }
        }
    }
}
