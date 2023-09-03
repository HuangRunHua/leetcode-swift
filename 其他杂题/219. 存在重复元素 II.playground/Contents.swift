import Foundation
/// **219. 存在重复元素 II**
/// 给你一个整数数组 nums 和一个整数 k ，判断数组中是否存在两个**不同的索引i和j**
/// 满足 nums[i] == nums[j] 且 abs(i - j) 小于等于k。如果存在，返回true；否则，返回false。
///
/// **示例 1：**
/// 输入：nums = [1,2,3,1], k = 3
/// 输出：true
///
/// **示例 2：**
/// 输入：nums = [1,2,3,1,2,3], k = 2
/// 输出：false
class Solution {
    // MARK: 方法一基于滑动窗口的解法(最快)
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        /// 滑动窗口的左边界与右边界
        var (left, right) = (0, 0)
        /// 存储窗口内元素的哈希表
        var window: Set<Int> = []
        while right < nums.count {
            /// 待插入集合的元素
            let insertNum = nums[right]
            right += 1
            /// 如果集合中存在该元素则说明存在符合条件的情况
            /// 在此处的均为满足索引**right - left 小于等于 k**的情况
            if window.contains(insertNum) { return true }
            /// 否则向集合中插入新的元素
            window.insert(insertNum)
            /// 滑动窗口过大需要缩小
            while right - left > k {
                /// 删除最左侧的一个元素
                let popNumber = nums[left]
                left += 1
                window.remove(popNumber)
            }
        }
        return false
    }
    
    // MARK: 解法二
    /// **思想：**创建一个哈希表用于存储某一个数组上次出现的位置
    func containsNearbyDuplicateSolution2(_ nums: [Int], _ k: Int) -> Bool {
        /// 创建一个哈希表用于存储某一个数组上次出现的位置
        var hashTable: [Int: Int] = [:]
        /// 只需一次遍历即可
        for index in 0..<nums.count {
            /// 从哈希表中查找元素上次出现的位置
            if let lastIndex = hashTable[nums[index]] {
                /// 位置差如果小于k则说明存在满足题目要求的两个元素
                if index - lastIndex <= k {
                    return true
                }
            }
            /// 更新本次出现的位置
            hashTable[nums[index]] = index
        }
        return false
    }
}

let solution = Solution()
print(solution.containsNearbyDuplicate([1,2,3,1], 3))
print(solution.containsNearbyDuplicate([1,2,3,4,2,5], 2))
print(solution.containsNearbyDuplicate([1,0,1,1], 1))




