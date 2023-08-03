import Foundation

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
/// **21. 合并两个有序链表**
/// 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
class Solution {
    // total: 12 ms
    func mergeTwoListsSolution1(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var list_1 = node2List(list1)
        var list_2 = node2List(list2)
        list_1.append(contentsOf: list_2)
        return generateNode(list_1.sorted())
    }
    
    func node2List(_ node: ListNode?) -> [Int] {
        if let node = node {
            var result: [Int] = []
            var temp_Node: ListNode? = node
            while temp_Node != nil {
                if let val = temp_Node?.val {
                    result.append(val)
                }
                temp_Node = temp_Node?.next
            }
            return result
        } else {
            return []
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
    
    // total: 20 ms
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil {
            return list2
        }
        if list2 == nil {
            return list1
        }

        var head_1 = list1
        var head_2 = list2
        var result: ListNode = ListNode(-1)
        var result_temp: ListNode? = result
        
        while (head_1 != nil) && (head_2 != nil) {
            if let val1 = head_1?.val, let val2 = head_2?.val {
                if val1 <= val2 {
                    result_temp?.next = head_1
                    head_1 = head_1?.next
                    result_temp = result_temp?.next
                } else {
                    result_temp?.next = head_2
                    head_2 = head_2?.next
                    result_temp = result_temp?.next
                }
            }
        }
        
        result_temp?.next = (head_1 == nil) ? head_2: head_1
        
        return result.next
        
    }
}

//let listNode_1: ListNode = ListNode(1)
//listNode_1.next = ListNode(2)
//listNode_1.next?.next = ListNode(4)
//
//let listNode_2: ListNode = ListNode(1)
//listNode_2.next = ListNode(3)
//listNode_2.next?.next = ListNode(4)


let solution = Solution()
var listNode_1 = solution.generateNode([])
var listNode_2 = solution.generateNode([])

let result = solution.mergeTwoLists(listNode_1, listNode_2)
var temp_Node = result

//var temp_Node: ListNode? = listNode_1
//
while temp_Node != nil {
    if let val = temp_Node?.val {
        print(val)
    }
    temp_Node = temp_Node?.next
}

