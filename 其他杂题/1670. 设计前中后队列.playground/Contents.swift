import Foundation
/// **1670. 设计前中后队列**
/// 请你设计一个队列，支持在前，中，后三个位置的 `push` 和 `pop` 操作。
/// 请你完成 `FrontMiddleBack` 类：
/// `FrontMiddleBack()` 初始化队列。
/// `void pushFront(int val)` 将 `val` 添加到队列的**最前面**。
/// `void pushMiddle(int val)` 将 `val` 添加到队列的**正中间**。
/// `void pushBack(int val)` 将 val 添加到队里的 最后面 。
/// `int popFront()` 将**最前面**的元素从队列中删除并返回值，如果删除之前队列为空，那么返回 -1 。
/// `int popMiddle()` 将**正中间**的元素从队列中删除并返回值，如果删除之前队列为空，那么返回 -1 。
/// `int popBack()` 将**最后面**的元素从队列中删除并返回值，如果删除之前队列为空，那么返回 -1 。
/// 请注意当有**两个**中间位置的时候，选择靠前面的位置进行操作。比方说：
/// 将 6 添加到 `[1, 2, 3, 4, 5]` 的中间位置，结果数组为 `[1, 2, 6, 3, 4, 5]` 。
/// 从 `[1, 2, 3, 4, 5, 6]` 的中间位置弹出元素，返回 3 ，数组变为 `[1, 2, 4, 5, 6]` 。
class FrontMiddleBackQueue {
    init() {}
    // MARK: 解题思路为始终维持left比right多一个元素或者两者个数相同即可。
    private var left: [Int] = []
    private var right: [Int] = []
    
    func pushFront(_ val: Int) {
        self.left.insert(val, at: 0)
        /// 始终维持左边最多比右边多`1`的情况
        if self.left.count - self.right.count >= 2 {
            self.right.insert(self.left.removeLast(), at: 0)
        }
    }
    
    func pushMiddle(_ val: Int) {
        /// 在中间插入的时候需要考虑`left`是否已经比`right`大`1`，
        /// 如果大`1`则在`right`头部插入`left`尾部的元素后再在`left`尾巴插入
        /// 否则在`left`尾巴插入
        if self.left.count == self.right.count + 1 {
            self.right.insert(self.left.removeLast(), at: 0)
        }
        /// 始终维持左边最多比右边多`1`的情况
        self.left.append(val)
    }
    
    func pushBack(_ val: Int) {
        self.right.append(val)
        /// 始终维持左边比右边多`1`或者相同的情况
        if self.right.count == self.left.count + 1 {
            self.left.append(self.right.removeFirst())
        }
    }
    
    func popFront() -> Int {
        /// 注意到`left`永远比`right`多`1`或者相同，如果`left`为空则说明没有元素，因此返回`-1`
        if self.left.isEmpty { return -1 }
        let popValue = self.left.removeFirst()
        /// `left`中有元素则在删除`left`头部元素之后，`left`的个数最多只可能比`right`少`1`，
        /// 则需要保证`left`永远不小于`right`即可。
        if self.left.count + 1 == self.right.count {
            self.left.append(self.right.removeFirst())
        }
        return popValue
    }
    
    func popMiddle() -> Int {
        /// 注意到`left`永远不少于`right`，如果`left`为空则说明没有元素，因此返回`-1`
        if self.left.isEmpty { return -1 }
        /// 如果`left`与`right`相同，则删除中间元素的时候按照题目要求删除靠前的，因此删除`left`尾巴的元素
        /// 如果`left`与`right`不同，则说明`left`只能比`right`多`1`，因此还是删除`left`尾巴的元素。
        let popValue = self.left.removeLast()
        /// 每次删除`left`元素后都要保证`left`永远不小于`right`即可。
        if self.right.count == self.left.count + 1 {
            self.left.append(self.right.removeFirst())
        }
        return popValue
    }
    
    func popBack() -> Int {
        /// 注意到`left`永远不少于`right`，如果`left`为空则说明没有元素，因此返回`-1`
        if self.left.isEmpty { return -1 }
        var popValue = 0
        /// 如果有元素，则需要根据`right`中是否有元素分情况讨论
        if self.right.isEmpty {
            /// `right`中没有元素对应`left`中只有一个元素
            /// 删除`left`之后`left`与`right`都没有元素因此恢复到初始状态，不再进一步操作
            popValue = self.left.removeLast()
        } else {
            /// `right`中有元素则在删除`right`尾巴元素之后需要保证`left`最多比`right`多`1`
            popValue = self.right.removeLast()
            if self.left.count == self.right.count + 2 {
                self.right.insert(self.left.removeLast(), at: 0)
            }
        }
        return popValue
    }
}

let obj = FrontMiddleBackQueue()
obj.pushFront(1)
obj.pushBack(2)
obj.pushMiddle(3)
obj.pushMiddle(4)
print(obj.popFront())   // 1
print(obj.popMiddle())  // 3
print(obj.popMiddle())  // 4
print(obj.popBack())    // 2
print(obj.popFront())   // -1
