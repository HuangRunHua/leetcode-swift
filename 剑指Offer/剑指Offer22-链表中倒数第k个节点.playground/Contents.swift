import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init() {
        self.val = 0
        self.next = nil
    }
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}


func generateNode(_ list: [Int]) -> ListNode? {
    if let first = list.first {
        var listNode = ListNode(first)
        
        var temp_Node_2 = listNode
        
        for val in list.dropFirst() {
            let temp_Node = ListNode(val)
            temp_Node_2.next = temp_Node
            if let next = temp_Node_2.next {
                temp_Node_2 = next
            }
        }
        return listNode
    } else {
        return nil
    }
}

class Solution {
    /// 执行用时：4 ms, 在所有 Swift 提交中击败了 95.00% 的用户
    /// 内存消耗：13.8 MB, 在所有 Swift 提交中击败了 23.33% 的用户
    /// 通过测试用例：208 / 208
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        var first = head
        var second = head
        for _ in 0..<k {
            second = second?.next
        }
        
        while second != nil {
            first = first?.next
            second = second?.next
        }
        
        return first
    }
}

let solution = Solution()
let head1 = generateNode([1,2,3,4,5])


var result = solution.getKthFromEnd(head1, 2)

while result != nil {
    if let val = result?.val {
        print(val)
    }
    result = result?.next
}
