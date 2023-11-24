# Solutions for LeetCode Sliding Window

本文件夹只包含`README`文档，文档主要整理平时刷题时候遇到的滑动窗口的问题以及对应的题解链接，题解的代码存储在路径`其他杂题/`中。

**滑动窗口**指的是这样一类问题的求解方法，在数组上通过双指针同向移动而解决的一类问题。其实这样的问题我们可以不必为它们专门命名一个名字，它们的解法其实是很自然的。

> **滑动窗口可以处理几乎所有的子串问题**

## 代码框架

```swift
private func generateDict(_ list: [Character]) -> [Character: Int] {
    var dict: [Character: Int] = [:]
    for char in list {
        dict[char, default: 0] += 1
    }
    return dict
}

func slidingWindow(_ s: [Character], _ p: [Character]) {
    var window: [Character: Int] = [:]
    var need: [Character: Int] = generateDict(p)
    
    var (left, right, valid) = (0, 0, 0)
    while (right < s.count) {
        // c是将要移入窗口的字符
        let char = s[right]
        // 右移窗口
        right += 1
        // 对窗口内的数据进行更新
        ...
        
        // DEBUG的输出位置
        print("window: [\(left), \(right)]")
        
        // 判断左侧窗口是否需要收缩
        while (window needs shrink) {
            // d 是将要移出窗口的字符
            let d = s[left];
            left += 1
            // 对窗口进行一系列更新
            ...
        }
    }
}
```

## 简单题

[219. 存在重复的元素II](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/219.%20存在重复元素%20II.playground/Contents.swift)

[643. 子数组最大平均数 I](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/643.%20子数组最大平均数%20I.playground/Contents.swift)

[1876. 长度为三且各字符不同的子字符串](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/1876.%20长度为三且各字符不同的子字符串.playground/Contents.swift)

[1984. 学生分数的最小差值](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/1984.%20学生分数的最小差值.playground/Contents.swift)

[2269. 找到一个数字的 K 美丽值](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/2269.%20找到一个数字的%20K%20美丽值.playground/Contents.swift)

[2760. 最长奇偶子数组](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/2760.%20最长奇偶子数组.playground/Contents.swift)

[2379. 得到 K 个黑块的最少涂色次数](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/2379.%20得到%20K%20个黑块的最少涂色次数.playground/Contents.swift)

[LCR 056. 两数之和 IV - 输入二叉搜索树](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/LCR%20056.%20两数之和%20IV%20-%20输入二叉搜索树.playground/Contents.swift)

## 中等题

[3. 无重复字符的最长子串](https://github.com/HuangRunHua/leetcode-swift/blob/main/热题100/3.%20无重复字符的最长子串.playground/Contents.swift)

[187. 重复的DNA序列](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/187.%20重复的DNA序列.playground/Contents.swift)

[209. 长度最小的子数组](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/209.%20长度最小的子数组.playground/Contents.swift)

[438. 找到字符串中所有字母异位词](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/438.%20找到字符串中所有字母异位词%20.playground/Contents.swift)

[567. 字符串的排列](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/567.%20字符串的排列.playground/Contents.swift)

[剑指 Offer 48. 最长不含重复字符的子字符串](https://github.com/HuangRunHua/leetcode-swift/blob/main/剑指Offer/剑指Offer48-最长不含重复字符的子字符串.playground/Contents.swift)

[395. 至少有 K 个重复字符的最长子串](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/395.%20至少有%20K%20个重复字符的最长子串.playground/Contents.swift)

[713. 乘积小于 K 的子数组](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/713.%20乘积小于%20K%20的子数组.playground/Contents.swift)

[1004. 最大连续1的个数 III](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/1004.%20最大连续1的个数%20III.playground/Contents.swift)

[248. 统计「优美子数组」](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/248.%20统计「优美子数组」.playground/Contents.swift)

[1297. 子串的最大出现次数](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/1297.%20子串的最大出现次数.playground/Contents.swift)

[1658. 将x减到0的最小操作数](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/1658.%20将x减到0的最小操作数.playground/Contents.swift)
[413. 等差数列划分](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/413.%20等差数列划分.playground/Contents.swift)
[2824. 统计和小于目标的下标对数目](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/2824.%20统计和小于目标的下标对数目.playground/Contents.swift)

## 困难题

[30. 串联所有单词的子串](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/30.%20串联所有单词的子串.playground/Contents.swift)

[76. 最小覆盖子串](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/76.%20最小覆盖子串.playground/Contents.swift)

[220. 存在重复元素 III](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/20.%20存在重复元素%20III.playground/Contents.swift)

[剑指 Offer 59 - I. 滑动窗口的最大值](https://github.com/HuangRunHua/leetcode-swift/blob/main/剑指Offer/剑指Offer59-I-滑动窗口的最大值.playground/Contents.swift)



