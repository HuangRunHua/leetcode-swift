import Foundation

class CountingSort {
    func countingSort(_ nums: inout [Int]) {
        /// Step 1: 获取待排序数组的最大值，以确定计数数组的大小
        var maxElement = nums.max() ?? 0
        /// Step 2: 创建计数数组，并将待排序数组中的元素进行计数
        var countArray = Array(repeating: 0, count: maxElement + 1)
        for num in nums {
            countArray[num] += 1
        }
        /// Step 3: 更新计数数组，计算每个元素在排序后的数组中的位置
        for i in 1..<countArray.count {
            countArray[i] += countArray[i - 1]
        }
        /// Step 4: 创建一个临时数组用于存放排序结果
        var sortedArray = Array(repeating: 0, count: nums.count)
        /// Step 5: 从待排序数组末尾开始遍历，根据计数数组中的位置信息将元素放入排序结果数组
        for num in nums.reversed() {
            let index = countArray[num] - 1
            sortedArray[index] = num
            /// 扣除已经读取的重复数字
            countArray[num] -= 1
        }
        /// Step 6: 将排序结果拷贝回原始数组
        nums = sortedArray
    }
}
