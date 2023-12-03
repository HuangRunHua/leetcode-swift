import Foundation
/// **100153. 需要添加的硬币的最小数量**
/// 给你一个下标从 `0` 开始的整数数组 `coins`，表示可用的硬币的面值，以及一个整数 `target` 。
/// 如果存在某个 `coins` 的子序列总和为 `x`，那么整数 `x` 就是一个可取得的金额 。
/// 返回需要添加到数组中的 任意面值 硬币的 最小数量 ，使范围 `[1, target]` 内的每个整数都属于可取得的金额 。
/// 数组的子序列是通过删除原始数组的一些（可能不删除）元素而形成的新的
/// 非空数组，删除过程不会改变剩余元素的相对位置。
class Solution {
    func minimumAddedCoins(_ coins: [Int], _ target: Int) -> Int {
        /// 先将硬币从小到大进行排序
        let coins = coins.sorted()
        /// 记录当前最大的可取金额范围
        var sum: Int = 0
        /// 最终的结果
        var result: Int = 0
        /// `target`中当前模拟插入的元素的索引
        var index: Int = 0
        while sum < target {
            let x = coins[index]
            /// `index < coins.count`用于防止数组访问越界
            if (index < coins.count) && (sum >= x - 1) {
                sum += x
                index += 1
            } else {
                sum += (sum + 1)
                result += 1
            }
        }
        return result
    }
}

let solution = Solution()
print(solution.minimumAddedCoins([1,4,10], 19))          // 2
print(solution.minimumAddedCoins([1,4,10,5,7,19], 19))   // 1
print(solution.minimumAddedCoins([1,1,1], 20))           // 3
