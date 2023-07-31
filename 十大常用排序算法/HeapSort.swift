import Foundation

public class HeapSort {
    /// 将数组的某个元素下移，维护最大堆性质
    private func heapifyDown(_ array: inout [Int], _ index: Int, _ heapSize: Int) {
        /// 计算非叶子节点左右子节点的索引
        let leftChild = 2 * index + 1
        let rightChild = 2 * index + 2
        /// 假设最大值索引为当前节点的索引
        var largestIndex = index
        /// 找到当前节点、左子节点和右子节点中的最大值索引
        if leftChild < heapSize && array[leftChild] > array[largestIndex] {
            largestIndex = leftChild
        }
        if rightChild < heapSize && array[rightChild] > array[largestIndex] {
            largestIndex = rightChild
        }
        /// 如果最大值索引不是当前节点，则交换它们的位置并递归将最大值索引的叶子节点全部调整
        if largestIndex != index {
            array.swapAt(index, largestIndex)
            heapifyDown(&array, largestIndex, heapSize)
        }
    }

    /// 建立最大堆
    private func buildMaxHeap(_ array: inout [Int]) {
        /// 从最后一个非叶子节点开始，依次向上调整
        let heapSize = array.count
        /// 找到所有的非叶子节点 (heapSize / 2 - 1为第一个非叶子节点，减1即可得到第二个非叶子节点)
        for i in stride(from: heapSize / 2 - 1, through: 0, by: -1) {
            heapifyDown(&array, i, heapSize)
        }
    }

    /// 堆排序算法
    func heapSort(_ array: inout [Int]) {
        /// 建立最大堆
        buildMaxHeap(&array)
        /// 交换堆顶和最后一个元素，并缩小堆的范围
        var heapSize = array.count
        for i in stride(from: array.count - 1, through: 1, by: -1) {
            /// 将堆顶元素与末尾元素进行交换得到当前堆的最大值
            array.swapAt(0, i)
            /// 调整堆的大小由于最大值已经找到因此大小减1即可
            heapSize -= 1
            /// 重新调整结构，使其满足堆定义，然后继续交换堆顶元素与当前末尾元素，
            /// 反复执行调整+交换步骤，直到整个序列有序。
            heapifyDown(&array, 0, heapSize)
        }
    }
}
