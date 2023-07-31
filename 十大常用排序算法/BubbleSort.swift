import Foundation

class BubbleSort {
    func bubbleSort(_ nums: inout [Int]) {
        for i in 0..<nums.count {
            for j in 0..<nums.count - 1 - i {
                if nums[j] < nums[j + 1] {
                    nums.swapAt(j, j+1)
                }
            }
        }
    }
}
