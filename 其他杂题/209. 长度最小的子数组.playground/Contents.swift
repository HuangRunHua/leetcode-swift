import Foundation
/// **209. 长度最小的子数组**
/// 给定一个含有n个正整数的数组和一个正整数target。
/// 找出该数组中满足其和 ≥ target 的长度最小的**连续子数组**[nums_l, nums_l+1, ..., nums_r-1, nums_r]
/// 并返回其长度。如果不存在符合条件的子数组，返回**0**。
///
/// **示例 1：**
/// 输入：target = 7, nums = [2,3,1,2,4,3]
/// 输出：2
/// 解释：子数组 [4,3] 是该条件下的长度最小的子数组。
///

// MARK: 基于滑动窗口的解法(最优解)
class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        /// 滑动窗口的左右边界
        var (left, right, sum) = (0, 0, 0)
        /// 最终的结果，初始化的时候设定为一个巨大的数字用于后续比较
        var res: Int = Int.max
        while right < nums.count {
            /// 即将叠加入子数组的元素
            let insertNum = nums[right]
            /// 更新右边界
            right += 1
            /// 更新窗口内子数组的和
            sum += insertNum
            /// 当窗口内的数组总和大于目标值target需要对窗口的左边界进行修改
            while (sum >= target) {
                /// 获取最小的长度
                res = min(res, right - left)
                /// 即将删除的左边界元素
                let popNumber = nums[left]
                /// 更新左边界
                left += 1
                /// 更新窗口内子数组的和
                sum -= popNumber
            }
        }
        return res == Int.max ? 0 : res
    }
}

// MARK:  下面是基于动态规划DP的解法
class Solution2 {
    // MARK: 基于动态规划的第一种解法
    /// 考虑适用DP算法来实现,不过很可惜内存超了
    /// 1. 确认**状态**与**选择**
    ///     - 状态: 子数组的左边界与右边界
    ///     - 选择: 是否选择当前的数
    /// 2. 确认dp的含义
    ///     - dp的维度: 二维dp，宽W为数组长度+1, 高H为数组长度+1
    ///     - dp[i][j]的含义: 子数组左边界i到右边界j的数组的总和
    ///     - dp递推规则:
    ///         1. 当 i==j 时候, 此时 dp[i][j] = nums[i-1]
    ///         2. 当 i!=j 时候, i为起点, 新增加的元素的索引是j, 因此dp[i][j] = dp[i][j-1] + nums[j-1]
    func minSubArrayLenSolution1(_ target: Int, _ nums: [Int]) -> Int {
        let W = nums.count
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: W+1), count: W+1)
        var minLength: Int = Int.max
        for i in 1...W {
            for j in i...W {
                if i == j {
                    dp[i][j] = nums[i-1]
                } else {
                    dp[i][j] = dp[i][j-1] + nums[j-1]
                }
                if dp[i][j] >= target {
                    minLength = min(minLength, j - i + 1)
                }
            }
        }
        return minLength == Int.max ? 0 : minLength
    }
    // MARK: 基于动态规划的第二种解法
    /// 上述DP算法是二维的dp当nums的数量很大时候容易内存过大，可考虑改为一维数组
    /// (最优的DP方法但是运行时间依旧较慢)
    /// 1. 确认**状态**与**选择**
    ///     - 状态: 子数组的右边界
    ///     - 选择: 是否选择当前的数
    /// 2. 确认dp的含义
    ///     - dp的维度: 一维dp，长度为数组长度+1
    ///     - dp[i]的含义: 以当前元素nums[i-1]为结尾的子数组的和
    ///     - dp递推规则:
    ///         1. dp[i] = dp[i-1] + 1
    func minSubArrayLenSolution2(_ target: Int, _ nums: [Int]) -> Int {
        let W = nums.count
        var dp: [Int] = Array(repeating: 0, count: W+1)
        var minLength: Int = Int.max
        var currentSum: Int = 0
        for i in 1...W {
            currentSum += nums[i-1]
            dp[i] = currentSum
            if dp[i] >= target {
                /// 当前子数组的和已经大于等于目标值
                /// 寻找满足条件的最小子数组
                var left = 0
                while currentSum - dp[left] >= target {
                    left += 1
                }
                minLength = min(minLength, i - left + 1)
            }
        }
        return minLength == Int.max ? 0 : minLength
    }
    
    // MARK: 基于动态规划的第三种解法
    /// 确认dp的含义
    ///   - dp的维度: 二维dp
    ///   - dp[i][j]的含义: 以当前元素nums[i-1]为结尾的子数组的和>=j时候的最小长度
    struct Element {
        /// 存储最小长度
        var length: Int = Int(10e6)
        /// 存储子数组的和
        var sum: Int = 0
    }
    
    private let MAX_TARGET = Int(10e6)
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        let (W, H) = (nums.count, nums.reduce(0, +))
        var dp = Array(repeating: Array(repeating: Element(), count: H+1), count: W + 1)
        
        for i in 1...W {
            dp[i][0].length = 1
            dp[i][0].sum = nums[i-1]
        }

        for i in 1...W {
            for j in 1...H {
                if j > nums[i - 1] {
                    dp[i][j].length = dp[i-1][j-nums[i-1]].length + 1
                    dp[i][j].sum = dp[i-1][j-nums[i-1]].sum + nums[i - 1]
                } else {
                    dp[i][j].length = 1
                    dp[i][j].sum = nums[i - 1]
                }
            }
        }
        /// 此时最小值应该为满足`sum >= target`的最小length的dp
        if let result = dp.flatMap({ $0 }).filter({ $0.sum >= target }).map({ $0.length }).min() {
            if result == MAX_TARGET {
                return 0
            } else {
                return result
            }
        } else {
            return 0
        }
    }
}

let solution = Solution()
print(solution.minSubArrayLen(7, [2,3,1,2,4,3])) //2
print(solution.minSubArrayLen(4, [1,4,4])) // 1
print(solution.minSubArrayLen(3, [1,1])) // 0
print(solution.minSubArrayLen(5, [2,1,1,2])) // 4
print(solution.minSubArrayLen(11, [1,2,3,4,5])) // 3
print(solution.minSubArrayLen(15, [5,1,3,5,10,7,4,9,2,8])) // 2




