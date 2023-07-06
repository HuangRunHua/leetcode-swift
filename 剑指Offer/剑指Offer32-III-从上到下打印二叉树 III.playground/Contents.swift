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
    /// 执行用时：8 ms, 在所有 Swift 提交中击败了 90.00% 的用户
    /// 内存消耗：13.9 MB, 在所有 Swift 提交中击败了 88.00% 的用户
    /// 通过测试用例：34 / 34
    func levelOrder(_ root: TreeNode?) -> [Int] {
        var results: [Int] = []
        var _root: TreeNode? = root
        if _root == nil {
            return []
        }
        
        
        return results
   }
}

///    3
///   /    \
///  9     20
/// /   \    /  \
///13   2 15   7
let root = TreeNode(3)
let l1 = TreeNode(9)
let l2 = TreeNode(20)
let l3 = TreeNode(15)
let l4 = TreeNode(7)
let l5 = TreeNode(13)
let l6 = TreeNode(2)
root.left = l1
root.right = l2
l2.left = l3
l2.right = l4
l1.left = l5
l1.right = l6

let solution = Solution()
print(solution.levelOrder(root))
