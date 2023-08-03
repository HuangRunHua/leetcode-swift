//
//  main.swift
//  leetcode
//
//  Created by Huang Runhua on 7/31/23.
//

import Foundation
/// **49. 字母异位词分组**
/// 给你一个字符串数组，请你将 字母异位词 组合在一起。可以按任意顺序返回结果列表。
///
/// **字母异位词是由重新排列源单词的所有字母得到的一个新单词。**
class Solution {
    /// 本做法依次统计每一个字符串，将该字符串所有的字符个数统计出来后用于更新 countRes
    /// countRes一共 26 位，代表所有字母出现的个数，每出现一个字符便更新该位的数值即可。
    /// 最后countRes作为字典的键。
    func groupAnagramsSolution1(_ strs: [String]) -> [[String]] {
        var dict: [[Int]: [String]] = [:]
        for str in strs {
            /// 26个英文字母在某一个单词中出现的个数
            var countRes: [Int] = Array(repeating: 0, count: 26)
            for c in str {
                countRes[Int(c.asciiValue! - Character("a").asciiValue!)] = countRes[Int(c.asciiValue! - Character("a").asciiValue!)] + 1
            }
            if let strs = dict[countRes] {
                dict[countRes]?.append(str)
            } else {
                dict[countRes] = [str]
            }
        }
        return Array(dict.values)
    }
    /// 更快的方法
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var res: [String: [String]] = [:]
        for str in strs {
            res[String(str.sorted()), default: []].append(str)
        }
        return Array(res.values)
    }
}

let solution = Solution()
print(solution.groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
print(solution.groupAnagrams([""]))
print(solution.groupAnagramsSolution1(["bdddddddddd","bbbbbbbbbbc"]))
