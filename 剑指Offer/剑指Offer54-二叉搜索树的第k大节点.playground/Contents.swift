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
    /// 执行用时：76 ms, 在所有 Swift 提交中击败了 6.82% 的用户
    /// 内存消耗：14.7 MB, 在所有 Swift 提交中击败了 86.36% 的用户
    /// 通过测试用例：91 / 91
    func kthLargestSolution1(_ root: TreeNode?, _ k: Int) -> Int {
        return tree2List(root)[k-1]
    }
    
    func tree2List(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        
        var cur: [TreeNode?] = [root]
        while !cur.isEmpty {
            var nex: [TreeNode?] = []
            for node in cur {
                if let node = node {
                    result.append(node.val)
                }
                if let left = node?.left {
                    nex.append(left)
                }
                if let right = node?.right {
                    nex.append(right)
                }
            }
            cur = nex
        }
        
        return result.sorted(by: { $0 > $1 })
    }
    
    var k = 0
    var result = -1
    
    /// 执行用时：48 ms, 在所有 Swift 提交中击败了 86.36% 的用户
    /// 内存消耗：14.8 MB, 在所有 Swift 提交中击败了 72.73% 的用户
    /// 通过测试用例：91 / 91
    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        self.k = k
        dfs(root)
        return self.result
    }
    
    /// 树的反向中序遍历
    func dfs(_ root: TreeNode?) {
        if root == nil { return }
        /// 优先遍历右节点
        dfs(root?.right)
        if let root = root {
            if (self.k == 0) {
                return
            }
            self.k -= 1
            if self.k == 0 { self.result = root.val }
        }
        dfs(root?.left)
        return
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
print(solution.kthLargest(root, 1))

