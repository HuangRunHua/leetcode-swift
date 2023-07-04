import Foundation

/// 执行用时：764 ms, 在所有 Swift 提交中击败了 97.67% 的用户
/// 内存消耗：16.4 MB, 在所有 Swift 提交中击败了 27.91% 的用户
/// 通过测试用例：55 / 55
class CQueue1 {

    var values: [Int] = []
    var headIndex: Int = 0
    var tailIndex: Int = 0
    var count: Int {
        return tailIndex-headIndex
    }
    
    init() {}
    
    func appendTail(_ value: Int) {
        /// 在value里面添加元素
        values.append(value)
        tailIndex += 1
    }
    
    func deleteHead() -> Int {
        if count == 0 {
            return -1
        } else {
            tailIndex -= 1
            return values.remove(at: 0)
        }
    }
}

class CQueue2 {

    var stack1: [Int] = []
    var stack2: [Int] = []
    var headIndex1: Int = 0
    var headIndex2: Int = 0
    
    init() {}
    
    func appendTail(_ value: Int) {
        stack2.append(value)
        headIndex2 += 1
    }
    
    func deleteHead() -> Int {
        if headIndex2 == 0 {
            return -1
        } else {
            /// 将stack 2中的元素推入stack 1中
            while headIndex2 != 0 {
                if let value = stack2.popLast() {
                    stack1.append(value)
                    headIndex1 += 1
                }
                headIndex2 -= 1
            }
            /// 删除stack 1中的最后一个元素
            if headIndex1 == 0 {
                return -1
            } else {
                if let value = stack1.popLast() {
                    headIndex1 -= 1
                    /// 将stack 1中的元素推入2中
                    while headIndex1 != 0 {
                        if let newValue = stack1.popLast() {
                            stack2.append(newValue)
                            headIndex2 += 1
                        }
                        headIndex1 -= 1
                    }
                    return value
                }
            }
        }
        return -1
    }
}

class CQueue {

    var stack1: [Int] = []
    var stack2: [Int] = []
    
    init() {}
    
    func appendTail(_ value: Int) {
        stack2.append(value)
    }
    
    func deleteHead() -> Int {
        if !stack1.isEmpty {
            return stack1.popLast()!
        }
        if stack2.isEmpty {
            return -1
        }
        while !stack2.isEmpty {
            stack1.append(stack2.popLast()!)
        }
        
        return stack1.popLast()!
    }
}

let obj = CQueue()
print(obj.deleteHead())
obj.appendTail(1)
obj.appendTail(2)
print(obj.deleteHead())
print(obj.deleteHead())
obj.appendTail(3)
obj.appendTail(4)
print(obj.deleteHead())
print(obj.deleteHead())
print(obj.deleteHead())
print(obj.deleteHead())
