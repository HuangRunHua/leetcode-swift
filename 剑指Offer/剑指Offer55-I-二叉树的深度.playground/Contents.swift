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
    /// 执行用时：20 ms, 在所有 Swift 提交中击败了 95.35% 的用户
    /// 内存消耗：14.3 MB, 在所有 Swift 提交中击败了 62.79% 的用户
    /// 通过测试用例：39 / 39
    func maxDepthSolution1(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        var res = 0
        var cur: [TreeNode?] = [root]
        while !cur.isEmpty {
            res += 1
            var nex: [TreeNode?] = []
            for node in cur {
                if let node = node {
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
        return res
    }
    
    /// 深度优先搜索算法
    /// 执行用时：16 ms, 在所有 Swift 提交中击败了 100.00% 的用户
    /// 内存消耗：14.4 MB, 在所有 Swift 提交中击败了 46.51% 的用户
    /// 通过测试用例：39 / 39
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        return max(maxDepth(root?.left), maxDepth(root?.right)) + 1
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
print(solution.maxDepth(root))

