import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    static public func generateListNode(from array: [Int]) -> ListNode? {
        var head: ListNode? = ListNode(0)
        var current: ListNode? = head
        for num in array {
            let next = ListNode(num)
            current?.next = next
            current = current?.next
        }
        return head?.next
    }
}

class Solution {
    func getIntersectionNode(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var (count1, count2) = (0, 0)
        var (_l1, _l2) = (list1, list2)
        while _l1 != nil {
            count1 += 1
            _l1 = _l1?.next
        }
        while _l2 != nil {
            count2 += 1
            _l2 = _l2?.next
        }
        (_l1, _l2) = (list1, list2)
        if count1 > count2 {
            var gap = count1 - count2
            while gap > 0 {
                _l1 = _l1?.next
                gap -= 1
            }
        } else {
            var gap = count2 - count1
            while gap > 0 {
                _l2 = _l2?.next
                gap -= 1
            }
        }
        
        while _l1?.val != _l2?.val {
            _l1 = _l1?.next
            _l2 = _l2?.next
        }
        return _l1 ?? _l1
    }
}

let solution = Solution()
let listNode1 = ListNode.generateListNode(from: [2,6,4])
let listNode2 = ListNode.generateListNode(from: [1,5])
let listNode3 = ListNode.generateListNode(from: [2,4])
listNode1?.next = listNode3
listNode2?.next = listNode3
dump(solution.getIntersectionNode(listNode1, listNode2))

