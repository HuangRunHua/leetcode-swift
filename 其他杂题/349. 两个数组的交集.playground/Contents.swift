import Foundation
/// **349. 两个数组的交集**
/// 给定两个数组 nums1 和 nums2 ，返回它们的交集 。输出结果中的每个元素一定是唯一的。我们可以 不考虑输出结果的顺序 。
class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let (l1, l2) = (nums1.count, nums2.count)
        return l1 < l2 ? _intersection(Set(nums1), Set(nums2)) : _intersection(Set(nums2), Set(nums1))
    }
    
    private func _intersection(_ shorts: Set<Int>, _ longs: Set<Int>) -> [Int] {
        var result: Set<Int> = []
        for short in shorts {
            if longs.contains(short) {
                result.insert(short)
            }
        }
        return Array(result)
    }
}

let solution = Solution()
print(solution.intersection([1,2,2,1], [2,2]))          // [2]
print(solution.intersection([4,9,5], [9,4,9,8,4]))      // [4,9]或[9,4]
