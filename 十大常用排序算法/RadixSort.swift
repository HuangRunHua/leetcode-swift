import Foundation

class RadixSort {
    /// 使用计数排序对待排序数组的指定位数进行排序
    private func countingSortForDigit(_ nums: inout [Int], _ exp: Int) {
        let n = nums.count
        var output = Array(repeating: 0, count: n)
        var count = Array(repeating: 0, count: 10)
        /// 计算当前位数上的数字出现次数
        for num in nums {
            let digit = (num / exp) % 10
            count[digit] += 1
        }
        /// 更新计数数组，计算每个数字在排序后的数组中的位置
        for i in 1..<10 {
            count[i] += count[i - 1]
        }
        /// 从原数组末尾开始遍历，根据计数数组中的位置信息将元素放入输出数组
        for i in stride(from: n - 1, through: 0, by: -1) {
            let digit = (nums[i] / exp) % 10
            output[count[digit] - 1] = nums[i]
            count[digit] -= 1
        }
        /// 将输出数组拷贝回原始数组
        for i in 0..<n {
            nums[i] = output[i]
        }
    }
    /// 基数排序
    func radixSort(_ nums: inout [Int]) {
        if nums.isEmpty { return }
        let maxNum = nums.max() ?? nums[0]
        // 对每个位数进行计数排序，从个位开始到最高位
        var exp = 1
        while maxNum / exp > 0 {
            countingSortForDigit(&nums, exp)
            exp *= 10
        }
    }
}
