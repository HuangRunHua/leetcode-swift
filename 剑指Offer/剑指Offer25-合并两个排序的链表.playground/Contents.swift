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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var dum: ListNode? = ListNode()
        var current: ListNode? = dum
        
        var list1 = l1
        var list2 = l2
        
        while (list1 != nil) && (list2 != nil) {
            if let v1 = list1?.val, let v2 = list2?.val {
                if v1 < v2 {
                    current?.next = list1
                    list1 = list1?.next
                } else {
                    current?.next = list2
                    list2 = list2?.next
                }
                current = current?.next
            }
        }
        
        current?.next = (list1 != nil) ? list1:list2
        
        return dum?.next
    }
}

let solution = Solution()
let head1 = generateNode([1,2,4])
let head2 = generateNode([1,3,4])


var result = solution.mergeTwoLists(head1, head2)

while result != nil {
    if let val = result?.val {
        print(val)
    }
    result = result?.next
}
