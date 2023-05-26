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

class Solution {
    
    // total: 20 ms
    func deleteDuplicatesSolution1(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(-1)
        var newHead = head
        dummy.next = newHead
        
        while newHead != nil {
            if newHead?.val == newHead?.next?.val {
                newHead?.next = newHead?.next?.next
            } else {
                newHead = newHead?.next
            }
        }
        
        return dummy.next
    }
    
    // total: 12 ms
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        var list = node2List(head)
        let id = removeDuplicates(&list)
        return generateNode(Array(list[0...id-1]))
    }
    

    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if let first = nums.first {
            var id: Int = 1
            var temp_num: Int = first
            
            for num in nums {
                if num != temp_num {
                    nums[id] = num
                    temp_num = num
                    id += 1
                }
            }
            
            return id
        } else {
            return 0
        }
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
}


let solution = Solution()
let head1 = solution.generateNode([1,1,2])
//let head2 = solution.generateNode([1,1,2,2,3,3])
let head2 = solution.generateNode([])

let result1 = solution.deleteDuplicates(head1)
let result2 = solution.deleteDuplicates(head2)
var temp_Node = result2

// var temp_Node: ListNode? = listNode_1
//
while temp_Node != nil {
    if let val = temp_Node?.val {
        print(val)
    }
    temp_Node = temp_Node?.next
}


