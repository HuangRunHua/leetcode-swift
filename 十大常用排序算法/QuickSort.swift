import Foundation

public class QuickSort {
    public func quickSort(_ array: inout [Int], left: Int, right: Int) {
        /// 如果待排序的数组大小为 1 或 0 直接返回即可
        if left >= right { return }
        /// 将数组待排序部分第一个元素作为基准数
        let povit = left
        var (i,j) = (left, right)
        while i < j {
            /// 先从数列的右边开始往左边找，找到第 1 个比基准数小的值
            while (i < j) && (array[j] >= array[left]) { j -= 1 }
            /// 先从数列的左边开始往右边找，找到第 1 个比基准数大的值
            while (i < j) && (array[i] <= array[left]) { i += 1 }
            /// 将两个数进行交换
            array.swapAt(i, j)
        }
        /// 最后 i==j, 此时需要将 i 与基准数进行交换，就完成了基准数左边都是小于等于基准数的值
        /// 基准数右边都是大于等于基准数的值
        array.swapAt(left, i)
        /// 重复上述过程即可
        quickSort(&array, left: left, right: i-1)
        quickSort(&array, left: i+1, right: right)
    }
}
