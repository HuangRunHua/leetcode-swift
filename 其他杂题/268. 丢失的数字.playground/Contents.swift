import Foundation
/// **268. 丢失的数字**
/// 给定一个包含 [0, n] 中 n 个数的数组 nums ，找出 [0, n] 这个范围内没有出现在数组中的那个数。
class Solution {
    // MARK: 解法一排序+搜索
    func missingNumberSolution1(_ nums: [Int]) -> Int {
        var _nums: [Int] = nums.sorted(by: { $0 < $1 })
        let N: Int = _nums.count
        for id in 0..<N {
            if id != _nums[id] { return id }
        }
        return N
    }
    // MARK: 解法二哈希+搜索
    func missingNumberSolution2(_ nums: [Int]) -> Int {
        var hashSet: Set<Int> = []
        let N: Int = nums.count
        for num in nums { hashSet.insert(num) }
        for id in 0..<N {
            if !hashSet.contains(id) {
                return id
            }
        }
        return N
    }
    // MARK: 解法三数学方法
    func missingNumberSolution3(_ nums: [Int]) -> Int {
        let N: Int = nums.count
        let theorySum: Int = N * (N + 1) / 2
        var realSum: Int = 0
        for num in nums {
            realSum += num
        }
        return theorySum - realSum
    }
    // MARK: 解法四位运算
    /// 注意到a^a = 0且a^0 = a
    /// 遍历一遍nums后将存储所有nums中的数字
    /// 再遍历一遍实际个数之后，nums中原来出现的数组和自身异或后位0不再带来影响
    /// 剩下的值就是nums中缺少的数字
    func missingNumber(_ nums: [Int]) -> Int {
        let N: Int = nums.count
        var xor: Int = 0
        for num in nums {
            xor ^= num
        }
        for id in 0...N {
            xor ^= id
        }
        return xor
    }
}

let solution = Solution()
print(solution.missingNumber([3,0,1]))
print(solution.missingNumber([0,1]))


