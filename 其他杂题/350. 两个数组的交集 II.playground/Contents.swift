import Foundation
/// **350. 两个数组的交集 II**
/// 给你两个整数数组 `nums1` 和 `nums2` ，请你以数组形式返回两数组的交集。返回结果中每个元素出现的次数，
/// 应与元素在两个数组中都出现的次数一致（如果出现次数不一致，则考虑取较小值）。可以不考虑输出结果的顺序。
///
/// **示例 1**
/// 输入：`nums1 = [4,9,5], nums2 = [9,4,9,8,4]`
/// 输出：`[4,9]`
class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        /// 将数组转为字典，字典的key为数字，value为数字的个数
        let (nums1Dict, nums2Dict) = (generateDict(nums1), generateDict(nums2))
        /// 计算两个字典中key的个数
        let (l1, l2) = (nums1Dict.keys.count, nums1Dict.keys.count)
        return l1 < l2 ? _intersection(nums1Dict, nums2Dict) : _intersection(nums2Dict, nums1Dict)
    }
    
    private func generateDict(_ nums: [Int]) -> [Int: Int] {
        var dict: [Int: Int] = [:]
        for num in nums { dict[num, default: 0] += 1 }
        return dict
    }
    
    private func _intersection(_ shorts: [Int: Int], _ longs: [Int: Int]) -> [Int] {
        var result: [Int] = []
        /// 遍历key最少的字典
        for key in shorts.keys {
            /// 如果两个字典中均含有该key则添加对应的长度即可
            if let count1 = longs[key], let count2 = shorts[key] {
                let insert = Array(repeating: key, count: min(count1, count2))
                result.append(contentsOf: insert)
            }
        }
        return result
    }
}

let solution = Solution()
print(solution.intersect([4,9,5], [9,4,9,8,4]))        // [4,9]
print(solution.intersect([1,2,2,1], [2,2]))            // [2,2]
