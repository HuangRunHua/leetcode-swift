import Foundation

class Solution {
    /// 执行用时：84 ms, 在所有 Swift 提交中击败了 68.75% 的用户
    /// 内存消耗：15.6 MB, 在所有 Swift 提交中击败了 25.00% 的用户
    /// 通过测试用例：45 / 45
    func majorityElementSolution1(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums.first!
        }
        let length = nums.count
        var set: [Int: Int] = [:]
        for num in nums {
            if let val = set[num] {
                set[num]! += 1
                if set[num]! > (length/2) {
                    return num
                }
            } else {
                set[num] = 1
            }
        }
        return 0
    }
    
    /// 执行用时：84 ms, 在所有 Swift 提交中击败了 68.75% 的用户
    /// 内存消耗：15.5 MB, 在所有 Swift 提交中击败了 78.13% 的用户
    /// 通过测试用例：45 / 45
    func majorityElement(_ nums: [Int]) -> Int {
        /// 先随便选一个数认为是出现最多的数
        var result = nums[0]
        /// 设置出现次数为1
        var counter = 1
        /// 遍历的时候要去除掉第一个元素
        for num in nums.dropFirst() {
            if num == result {
                /// 如果遇到相同的数出现次数`+1`
                counter += 1
            } else {
                /// 如果遇到不相同的数出现次数`-1`
                counter -= 1
                /// 如果出现次数变为0了则换成当前的数字
                /// 并重新开始计数
                if (counter == 0) {
                    result = num
                    counter += 1
                }
            }
        }
        /// 无论如何都能决出胜负
        return result
    }
}

let solution = Solution()
print(solution.majorityElement([1, 2, 9, 2, 4, 4, 4, 4, 5]))
