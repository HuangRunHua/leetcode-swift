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

public func buildBinaryTree(_ values: [Int?]) -> TreeNode? {
    guard !values.isEmpty else { return nil }
    
    var queue: [TreeNode?] = []
    let root = TreeNode(values[0]!)
    queue.append(root)
    
    var index = 1
    
    while index < values.count {
        if let parent = queue.removeFirst() {
            if let leftValue = values[index] {
                parent.left = TreeNode(leftValue)
                queue.append(parent.left)
            }
            index += 1
            
            if index < values.count, let rightValue = values[index] {
                parent.right = TreeNode(rightValue)
                queue.append(parent.right)
            }
            index += 1
        }
    }
    return root
}
