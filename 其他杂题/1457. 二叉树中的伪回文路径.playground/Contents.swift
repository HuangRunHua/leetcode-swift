import Foundation
/// **1457. 二叉树中的伪回文路径**
/// 给你一棵二叉树，每个节点的值为 1 到 9 。
/// 我们称二叉树中的一条路径是 「伪回文」的，当它满足：路径经过的所有节点值的排列中，存在一个回文序列。
/// 请你返回从根到叶子节点的所有路径中伪回文路径的数目。
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
class Solution {
    func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
        var nums: [Int] = Array(repeating: 0, count: 10)
        var result: Int = 0
        backTrace(root, &nums, &result)
        return result
    }
    
    func backTrace(
        _ root: TreeNode?,
        _ nums: inout [Int],
        _ result: inout Int
    ) {
        if root == nil { return }
        nums[root!.val] += 1
        if (root?.left == nil) && (root?.right == nil) {
            result += (isPalindrome(nums) ? 1 : 0)
        } else {
            backTrace(root?.left, &nums, &result)
            backTrace(root?.right, &nums, &result)
        }
        nums[root!.val] -= 1
    }
    
    func isPalindrome(_ nums: [Int]) -> Bool {
        var oddNum: Int = 0
        for num in nums {
            if num & 1 == 1 { oddNum += 1 }
        }
        return oddNum <= 1
    }
}

let solution = Solution()
let root = TreeNode(2)
let left = TreeNode(3)
let right = TreeNode(1)
root.left = left
root.right = right
left.left = TreeNode(3)
left.right = TreeNode(1)
right.right = TreeNode(1)

print(solution.pseudoPalindromicPaths(root))          // 2
