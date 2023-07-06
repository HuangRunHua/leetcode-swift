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
    /// 执行用时：8ms, 在所有 Swift 提交中击败了 100.00% 的用户
    /// 内存消耗：14 MB, 在所有 Swift 提交中击败了 15.79% 的用户
    /// 通过测试用例：68 / 68
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return (root == nil) ? true: recur(root?.left, root?.right)
    }
    
    func recur(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if (left == nil) && (right == nil) {
            return true
        }
        if left == nil {
            if right != nil { return false }
        }
        if right == nil {
            if left != nil { return false }
        }
        if let left = left, let right = right {
            if left.val != right.val { return false }
        }
        
        return recur(left?.left, right?.right) && recur(left?.right, right?.left)
    }
}


func printTreeNode(_ root: TreeNode?) {
    var result: [Int] = []
    var cur: [TreeNode?] = [root]
    while !cur.isEmpty {
        var nex: [TreeNode?] = []
        for node in cur {
            if let node = node {
                result.append(node.val)
                if let left = node.left {
                    nex.append(left)
                }
                if let right = node.right {
                    nex.append(right)
                }
            }
        }
        cur = nex
    }
    
    print(result)
}

///    2
///   /    \
///  3      3
/// /   \       \
///4     5      4
let root = TreeNode(2)
let l1 = TreeNode(3)
let l2 = TreeNode(3)
let l3 = TreeNode(4)
let l4 = TreeNode(5)
//let l5 = TreeNode(13)
let l6 = TreeNode(4)
root.left = l1
root.right = l2
l1.left = l3
l1.right = l4
//l2.left = l3
l2.right = l6

printTreeNode(root)

let solution = Solution()
print(solution.isSymmetric(root))
