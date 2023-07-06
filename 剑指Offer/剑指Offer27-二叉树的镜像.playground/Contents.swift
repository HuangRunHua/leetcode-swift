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
    /// 执行用时：4ms, 在所有 Swift 提交中击败了 76.09% 的用户
    /// 内存消耗：13.9 MB, 在所有 Swift 提交中击败了 67.39% 的用户
    /// 通过测试用例：68 / 68
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        let temp = root?.left
        root?.left = root?.right
        root?.right = temp
        
        mirrorTree(root?.left)
        mirrorTree(root?.right)
        return root
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
let result = solution.mirrorTree(root)
printTreeNode(result)
