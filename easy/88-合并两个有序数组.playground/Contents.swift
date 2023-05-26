import Foundation

class Solution {
    // total: 8 ms
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        if n == 0 {
            return
        }
        
        if m == 0 {
            nums1 = nums2
            return
        }
        
        var count1 = nums1.count
        for id in 0..<nums1.count-m {
            nums1[count1-1-id] = nums2[id]
        }
        
        nums1.sort()
    }
}

let solution = Solution()

//var nums1 = [1,2,3,0,0,0]
//var nums2 = [2,5,6]
//
//solution.merge(&nums1, 3, nums2, 3)
//print(nums1)
//
//var nums3 = [1]
//var nums4: [Int] = []
//
//solution.merge(&nums3, 1, nums4, 0)
//print(nums3)
//
//var nums5 = [0]
//var nums6 = [1]
//
//solution.merge(&nums5, 0, nums6, 1)
//print(nums5)

var nums7 = [4,0,0,0,0,0]
var nums8 = [1,2,3,5,6]

solution.merge(&nums7, 1, nums8, 5)
print(nums7)

