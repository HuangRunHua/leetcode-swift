import Foundation
/// **LCR 056. 两数之和 IV - 输入二叉搜索树**
/// 给定一个二叉搜索树的 根节点 root 和一个整数 k , 
/// 请判断该二叉搜索树中是否存在两个节点它们的值之和等于 k 。假设二叉搜索树中节点的值均唯一。
///
/// **示例 1**
/// 输入: root = [8,6,10,5,7,9,11], k = 12
/// 输出: true
/// 解释: 节点 5 和节点 7 之和等于 12

// MARK: 解法1
class Solution1 {
    /// 哈希表+树的前序遍历
    private var hashTable: Set<Int> = []
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        return recur(root, k)
    }
    
    func recur(_ root: TreeNode?, _ target: Int) -> Bool {
        if root == nil { return false }
        /// 类似两数之和的算法
        if hashTable.contains(target - root!.val) { return true }
        hashTable.insert(root!.val)
        return recur(root?.left, target) || recur(root?.right, target)
    }
}

// MARK: 解法2
class Solution {
    private var nums: [Int] = []
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        /// 利用中序遍历的性质将所有元素存到数组内得到递增的数组
        recur(root, k)
        /// 利用双指针求取最终结果
        var (left, right) = (0, nums.count-1)
        while left < right {
            if nums[right] + nums[left] == k { return true }
            else if nums[right] + nums[left] > k { right -= 1 }
            else { left += 1 }
        }
        return false
    }
    
    func recur(_ root: TreeNode?, _ target: Int) {
        if root == nil { return }
        recur(root?.left, target)
        nums.append(root!.val)
        recur(root?.right, target)
    }
}

let solution = Solution()
let root = buildBinaryTree([5,3,6,2,4,nil,7])
print(solution.findTarget(root, 9))
