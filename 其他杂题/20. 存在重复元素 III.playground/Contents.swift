import Foundation
/// **20. 存在重复元素 III**
/// 给你一个整数数组 nums 和两个整数 indexDiff 和 valueDiff 。
/// 找出满足下述条件的下标对 (i, j)：
///     - i != j,
///     - indexDiff >= abs(i - j)
///     - valueDiff >= abs(nums[i] - nums[j])
/// 如果存在，返回 true ；否则，返回 false 。
class Solution {
    // MARK: 解法一速度相当慢
    /// 本质就是两个for循环寻找数据
    func containsNearbyAlmostDuplicateSolution1(_ nums: [Int], _ indexDiff: Int, _ valueDiff: Int) -> Bool {
        var (left, right) = (0,0)
        while right < nums.count {
            let insertNum = nums[right]
            /// 为了防止索引 left>right 后报错添加了if判断条件
            if left < right {
                /// 遍历窗口内的数据，找到符合条件的数据
                for index in left..<right {
                    if abs(nums[index] - insertNum) <= valueDiff { return true }
                }
            }
            /// 由于要求 i != j 因此这句话应该放在这
            /// 更新右边界
            right += 1
            
            while right - left > indexDiff {
                left += 1
            }
        }
        return false
    }
    
    // MARK: 解法二
    /// 对于元素 x，其影响的区间为 [x − valueDiff,x + valueDiff]。于是我们可以设定桶的大小为 valueDiff+1。
    /// 如果两个元素同属一个桶，那么这两个元素必然符合条件。如果两个元素属于相邻桶，
    /// 那么我们需要校验这两个元素是否差值不超过 valueDiff。
    /// 如果两个元素既不属于同一个桶，也不属于相邻桶，那么这两个元素必然不符合条件。
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ indexDiff: Int, _ valueDiff: Int) -> Bool {
        var (left, right) = (0, 0)
        /// 维护一个桶
        var set: [Int: Int] = [:]
        while right < nums.count {
            let insertNum = nums[right]
            right += 1
            /// 计算桶的ID
            let id = getID(insertNum, valueDiff + 1)
            /// 桶中有相同的元素必然存在符合条件的i与j
            if let _ = set[id] { return true }
            /// 判断相邻的桶中是否有元素符合条件
            if let value = set[id-1], abs(value - insertNum) <= valueDiff { return true }
            if let value = set[id+1], abs(value - insertNum) <= valueDiff { return true }
            /// 更新桶内元素，由于只判断有没有因此只需要一个value就可以，不需要存储所有value数组
            set[id] = insertNum
            
            while right - left > indexDiff {
                /// 待删除的元素
                let popNumID = getID(nums[left], valueDiff + 1)
                set.removeValue(forKey: popNumID)
                left += 1
            }
        }
        return false
    }
    
    /// x小于0时 x+1是为了让-1到-t在一个桶内
    /// 最后的-1就是为了避免-t到t-1落在一个桶内
    private func getID(_ num: Int, _ size: Int) -> Int {
        return num < 0 ? (num + 1)/size - 1 : num/size
    }
}

let solution = Solution()
print(solution.containsNearbyAlmostDuplicate([1,2,3,1], 3, 0))
print(solution.containsNearbyAlmostDuplicate([1,5,9,1,5,9], 2, 3))
print(solution.containsNearbyAlmostDuplicate([1,2,1,1], 1, 0))



