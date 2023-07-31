import Foundation

class BucketSort {
    /// 桶排序
    func bucketSort(_ nums: inout [Int]) {
        let n = nums.count
        /// Step 1: 创建空桶
        var buckets: [[Int]] = Array(repeating: [], count: n)
        /// Step 2: 将元素映射到不同的桶中
        for num in nums {
            /// 映射函数一般是 f = array[i] / k; k^2 = n; n是所有元素个数
            let index = Int(num/(n*n))
            buckets[index].append(num)
        }
        /// Step 3: 对每个非空桶中的元素进行排序
        for i in 0..<n {
            if !buckets[i].isEmpty {
                insertionSort(&buckets[i])
            }
        }
        /// Step 4: 将排序后的元素合并回原始数组
        var index = 0
        for i in 0..<n {
            for num in buckets[i] {
                nums[index] = num
                index += 1
            }
        }
    }

    // 插入排序（用于对每个非空桶中的元素进行排序）
    private func insertionSort(_ nums: inout [Int]) {
        let n = nums.count
        for i in 1..<n {
            let key = nums[i]
            var j = i - 1
            while j >= 0 && nums[j] > key {
                nums[j + 1] = nums[j]
                j -= 1
            }
            nums[j + 1] = key
        }
    }
}
