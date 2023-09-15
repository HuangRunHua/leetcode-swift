import Foundation
/// **658. 找到 K 个最接近的元素**
/// 给定一个**排序好**的数组 arr ，两个整数 k 和 x
/// 从数组中找到最靠近 x（两数之差最小）的 k 个数。
/// 返回的结果必须要是按升序排好的。
///
/// 整数 a 比整数 b 更接近 x 需要满足：
/// |b - x| > |a - x| 或者
/// |a - x| == |b - x| 且 b > a
///
/// **示例 1**
/// 输入：arr = [1,2,3,4,5], k = 4, x = 3
/// 输出：[1,2,3,4]
class Solution {
    // MARK: 方法一直接排序
    func findClosestElementsSoluton1(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        return Array(arr.sorted(by: { abs($0 - x) < abs($1 - x) }).prefix(k)).sorted()
    }
    // MARK: 方法二采用二分查找 + 双指针
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        /// 将元素划以right分为两个部分，前半部分元素均小于x，后半部分元素均大于等于x
        var right = arr.firstIndex(where: { $0 >= x }) ?? arr.count - 1
        /// left现在属于比较靠近x的元素
        var left = right - 1
        /// 取 k 个元素
        for _ in 1...k {
            /// 如果左边指针已经到头了则不再取左边的元素
            if left < 0 {
                right += 1
            } else if right >= arr.count || x - arr[left] <= arr[right] - x {
                /// 右边到头了或者左边的元素大小更靠近x则添加一个左边的元素
                left -= 1
            } else {
                right += 1
            }
        }
        return Array(arr[left+1..<right])
    }
}

let solution = Solution()
print(solution.findClosestElements([1,2,3,4,5], 4, 3))
print(solution.findClosestElements([1,2,3,4,5], 4, -1))
print(solution.findClosestElements([1,1,1,10,10,10], 1, 9))
