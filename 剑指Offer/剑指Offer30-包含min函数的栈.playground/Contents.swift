import Foundation

class MinStack1 {
    
    var minNumber: Int = 0
    var topNumber: Int = 0
    var stack: [Int] = []
    
    init() {}
    
    func push(_ x: Int) {
        stack.append(x)
        if let minnumber = self.stack.min() {
            self.minNumber = minnumber
        }
        if let topNumber = self.stack.last {
            self.topNumber = topNumber
        }
    }
    
    func pop() {
        stack.popLast()
        if let minnumber = self.stack.min() {
            self.minNumber = minnumber
        }
        if let topNumber = self.stack.last {
            self.topNumber = topNumber
        }
    }
    
    func top() -> Int {
        return topNumber
    }
    
    func min() -> Int {
        return minNumber
    }
}


class MinStack {
    var stack: [Int] = []
    /// 辅助Stack，用来存取每次读取的最小值
    /// 在获取最小值的时候直接返回`assistStack`的最后一个元素即可
    var assistStack: [Int] = []
    
    init() {}
    
    func push(_ x: Int) {
        stack.append(x)
        if assistStack.isEmpty {
            assistStack.append(x)
        } else {
            if let last = assistStack.last {
                if last >= x {
                    assistStack.append(x)
                }
            }
        }
    }
    
    func pop() {
        if let last1 = stack.last {
            if let last2 = assistStack.last {
                if last1 == last2 {
                    assistStack.popLast()
                }
            }
        }
        stack.popLast()
    }
    
    func top() -> Int {
        if let last = stack.last {
            return last
        }
        return -1
    }
    
    func min() -> Int {
        if let last = assistStack.last {
            return last
        }
        return -1
    }
}

let obj = MinStack()
obj.push(-2);
obj.push(0);
obj.push(-3);
print(obj.top())
print(obj.min())
obj.pop()
obj.pop()
obj.pop()
obj.pop()
print(obj.top())
print(obj.min())
