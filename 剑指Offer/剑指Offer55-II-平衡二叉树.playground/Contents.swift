import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    /// 执行用时：36 ms, 在所有 Swift 提交中击败了 56.10% 的用户
    /// 内存消耗：14.7 MB, 在所有 Swift 提交中击败了 29.27% 的用户
    /// 通过测试用例：39 / 39
    func isBalancedSolution1(_ root: TreeNode?) -> Bool {
        if root == nil { return true }
        return (abs(maxDepth(root?.left) - maxDepth(root?.right)) <= 1) && (isBalanced(root?.left)) && (isBalanced(root?.right))
    }
    
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        return max(maxDepth(root?.left), maxDepth(root?.right)) + 1
    }
    
    /// 执行用时：36 ms, 在所有 Swift 提交中击败了 56.10% 的用户
    /// 内存消耗：14.7 MB, 在所有 Swift 提交中击败了 29.27% 的用户
    /// 通过测试用例：39 / 39
    func isBalanced(_ root: TreeNode?) -> Bool {
        return recur(root) != -1
    }
    
    func recur(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        let left = recur(root?.left)
        if left == -1 { return -1 }
        let right = recur(root?.right)
        if right == -1 { return -1 }
        return abs(left-right) <= 1 ? max(left, right)+1 : -1
    }
}

let root = TreeNode(3)
let l1 = TreeNode(1)
let l2 = TreeNode(4)
root.left = l1
root.right = l2
let l3 = TreeNode(2)
l1.right = l3

let solution = Solution()
print(solution.isBalanced(root))

