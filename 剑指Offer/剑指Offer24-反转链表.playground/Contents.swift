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
    /// 执行用时：16 ms, 在所有 Swift 提交中击败了 19.05% 的用户
    /// 内存消耗：14.8 MB, 在所有 Swift 提交中击败了 8.57% 的用户
    func reverseListSolution1(_ head: ListNode?) -> ListNode? {
        var first = head
        var nodeList: [Int] = []
        while first != nil {
            if let val = first?.val {
                nodeList.append(val)
            }
            first = first?.next
        }
        
        return generateNode(nodeList.reversed())
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
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var current = head
        var pre: ListNode? = nil
        while current != nil {
            let temp = current?.next
            current?.next = pre
            pre = current
            current = temp
        }
        
        return pre
    }
}

let solution = Solution()
let head1 = generateNode([1,2,3,4,5])


var result = solution.reverseList(head1)
while result != nil {
    if let val = result?.val {
        print(val)
    }
    result = result?.next
}
