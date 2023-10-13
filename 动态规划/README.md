# Solutions for LeetCode Dynamic Programming

本文件夹只包含`README`文档，文档主要整理平时刷题时候遇到的动态规划的问题以及对应的题解链接，题解的代码存储在路径`其他杂题/`中。

**动态规划**是一种在数学、管理科学、计算机科学、经济学和生物信息学中使用的，通过把原问题分解为相对简单的子问题的方式求解复杂问题的方法。

动态规划常常适用于有重叠子问题和最优子结构性质的问题，并且记录所有子问题的结果，因此动态规划方法所耗时间往往远少于朴素解法。

动态规划有自底向上和自顶向下两种解决问题的方式。自顶向下即记忆化递归，自底向上就是递推。

使用动态规划解决的问题有个明显的特点，一旦一个子问题的求解得到结果，以后的计算过程就不会修改它，这样的特点叫做无后效性，求解问题的过程形成了一张有向无环图。动态规划只解决每个子问题一次，具有天然剪枝的功能，从而减少计算量。

## 简单题

[剑指 Offer 10- I. 斐波那契数列](https://github.com/HuangRunHua/leetcode-swift/tree/main/剑指Offer/剑指Offer10-I-斐波那契数列.playground/Contents.swift)

[剑指 Offer 10- II. 青蛙跳台阶问题](https://github.com/HuangRunHua/leetcode-swift/tree/main/剑指Offer/剑指Offer10-II-青蛙跳台阶问题.playground/Contents.swift)

[剑指 Offer 42. 连续子数组的最大和](https://github.com/HuangRunHua/leetcode-swift/tree/main/剑指Offer/剑指Offer42-连续子数组的最大和.playground/Contents.swift)

[剑指 Offer 42. 连续子数组的最大和(模板套路解法)](https://github.com/HuangRunHua/leetcode-swift/blob/main/剑指Offer/剑指Offer42-连续子数组的最大和(解法2).playground/Contents.swift)

[70. 爬楼梯](https://github.com/HuangRunHua/leetcode-swift/tree/main/剑指Offer/剑指Offer10-II-青蛙跳台阶问题.playground/Contents.swift)

[118. 杨辉三角](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/118-Yang-Hui-Triangle.playground/Contents.swift)

[119. 杨辉三角 II](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/119-Yang-Hui-Triangle2.playground/Contents.swift)

[121. 买卖股票的最佳时机](https://github.com/HuangRunHua/leetcode-swift/tree/main/剑指Offer/剑指Offer63-股票的最大利润.playground/Contents.swift)

[LCR 127. 跳跃训练](https://github.com/HuangRunHua/leetcode-swift/tree/main/剑指Offer/剑指Offer10-II-青蛙跳台阶问题.playground/Contents.swift)

[1646. 获取生成数组中的最大值](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/1646.%20获取生成数组中的最大值.playground/Contents.swift)

[1137. 第 N 个泰波那契数](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/1137.%20第%20N%20个泰波那契数.playground/Contents.swift)

[746. 使用最小花费爬楼梯](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/746.%20使用最小花费爬楼梯.playground/Contents.swift)

[338. 比特位计数](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/338.%20比特位计数.playground/Contents.swift)

[LCS 01. 下载插件](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/LCS%2001.%20下载插件.playground/Contents.swift)

[面试题 16.17. 连续数列](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/面试题%2016.17.%20连续数列.playground/Contents.swift)

[面试题 17.16. 按摩师](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/面试题%2017.16.%20按摩师.playground/Contents.swift)

[面试题 08.01. 三步问题](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/面试题%2008.01.%20三步问题.playground/Contents.swift)


## 中等

[剑指 Offer 63. 股票的最大利润](https://github.com/HuangRunHua/leetcode-swift/tree/main/剑指Offer/剑指Offer63-股票的最大利润.playground/Contents.swift)

[剑指 Offer 47. 礼物的最大价值](https://github.com/HuangRunHua/leetcode-swift/tree/main/剑指Offer/剑指Offer47-礼物的最大价值.playground/Contents.swift)

[剑指 Offer 46. 把数字翻译成字符串](https://github.com/HuangRunHua/leetcode-swift/tree/main/剑指Offer/剑指Offer46-把数字翻译成字符串.playground/Contents.swift)

[剑指 Offer 48. 最长不含重复字符的子字符串](https://github.com/HuangRunHua/leetcode-swift/tree/main/剑指Offer/剑指Offer48-最长不含重复字符的子字符串.playground/Contents.swift)

[剑指 Offer 49. 丑数](https://github.com/HuangRunHua/leetcode-swift/tree/main/剑指Offer/剑指Offer49-丑数.playground/Contents.swift)

[剑指 Offer 60. n个骰子的点数](https://github.com/HuangRunHua/leetcode-swift/tree/main/剑指Offer/剑指Offer60-n个骰子的点数.playground/Contents.swift)

[978. 最长湍流子数组](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/978.%20最长湍流子数组.playground/Contents.swift)

[718. 最长重复子数组](https://github.com/HuangRunHua/leetcode-swift/blob/main/其他杂题/718.%20最长重复子数组.playground/Contents.swift)

## 困难

[剑指 Offer 19. 正则表达式匹配](https://github.com/HuangRunHua/leetcode-swift/tree/main/剑指Offer/剑指Offer19-正则表达式匹配.playground/Contents.swift)

[剑指 Offer 19. 正则表达式匹配解法2](https://github.com/HuangRunHua/leetcode-swift/blob/main/剑指Offer/剑指Offer19.正则表达式匹配解法2.playground/Contents.swift)
