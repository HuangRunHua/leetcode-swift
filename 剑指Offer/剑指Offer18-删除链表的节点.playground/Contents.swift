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
    
    func deleteNodeSolution2(_ head: ListNode?, _ val: Int) -> ListNode? {
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
    
    func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
        /// 定义一个新的头节点，该节点指向题目的 head 头节点
        let newhead: ListNode? = ListNode(0, head)
        /// 当前遍历的节点用于遍历
        var current: ListNode? = newhead
        /// 检查下一个元素是否存在
        while current?.next != nil {
            /// 判断下一个元素是否是要删除的元素
            if let nextVal = current?.next?.val, nextVal == val {
                /// 设置临时变量存放下下个元素
                let temp = current?.next?.next
                /// 直接越过下一个元素将当前的元素指向下下个元素
                current?.next = temp
                /// 删除完成直接跳出循环
                break
            }
            /// 若没有找到当前元素则继续遍历
            current = current?.next
        }
        /// 注意返回新头节点指向的下一个元素
        return newhead?.next
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
