import Foundation

class InsertSort {
    func insertSort(_ nums: inout [Int]) {
        for curID in 1..<nums.count {
            for id in 0..<curID {
                if nums[id] > nums[curID] { nums.swapAt(id, curID) }
            }
        }
    }
}
