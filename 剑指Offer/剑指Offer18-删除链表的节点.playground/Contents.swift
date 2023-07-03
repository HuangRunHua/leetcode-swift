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
    func deleteNodeSolution1(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head == nil {
            return head
        }
        
        if let firstVal = head?.val {
            if firstVal == val {
                return head?.next
            }
        }
        
        var first = head
        var second = head?.next
        while second != nil {
            if let nodeVal = second?.val {
                if nodeVal == val {
                    let temp = second?.next
                    first?.next = temp
                    second = second?.next
                } else {
                    first = first?.next
                    second = second?.next
                }
            }
        }
        return head
    }
    
    func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head == nil {
            return head
        }
        
        if let firstVal = head?.val {
            if firstVal == val {
                return head?.next
            }
        }
        
        var first = head
        var second = head?.next
        while second != nil{
            if let nodeVal = second?.val {
                if nodeVal == val {
                    let temp = second?.next
                    first?.next = temp
                    second = second?.next
                    return head
                } else {
                    first = first?.next
                    second = second?.next
                }
            }
        }
        return head
    }
}

let solution = Solution()
let head1 = generateNode([4,5,1,9])


var result = solution.deleteNode(head1, 5)
while result != nil {
    if let val = result?.val {
        print(val)
    }
    result = result?.next
}
