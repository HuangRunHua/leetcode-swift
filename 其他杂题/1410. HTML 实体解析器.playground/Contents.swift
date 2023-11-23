import Foundation
/// **1410. HTML 实体解析器**
///「HTML 实体解析器」 是一种特殊的解析器，它将 HTML 代码作为输入，并用字符本身替换掉所有这些特殊的字符实体。
/// HTML 里这些特殊字符和它们对应的字符实体包括：
/// 双引号：字符实体为 &quot; ，对应的字符是 " 。
/// 单引号：字符实体为 &apos; ，对应的字符是 ' 。
/// 与符号：字符实体为 &amp; ，对应对的字符是 & 。
/// 大于号：字符实体为 &gt; ，对应的字符是 > 。
/// 小于号：字符实体为 &lt; ，对应的字符是 `<` 。
/// 斜线号：字符实体为 &frasl; ，对应的字符是 / 。
/// 给你输入字符串 text ，请你实现一个 HTML 实体解析器，返回解析器解析后的结果。
class Solution1 {
    private let htmlCode: [String: String] = [
        "&quot;": "\"",
        "&apos;": "'",
        "&amp;": "&",
        "&gt;": ">",
        "&lt;": "<",
        "&frasl;": "/"
    ]
    func entityParser(_ text: String) -> String {
        let textChars: [Character] = Array(text)
        var result: String = ""
        var index: Int = 0
        while index < textChars.count {
            var specialStr: [Character] = []
            if textChars[index] == Character("&") {
                for id in 0...6 {
                    if id + index < textChars.count {
                        specialStr.append(textChars[id + index])
                        if textChars[id + index] == Character(";") {
                            break
                        }
                    }
                }
                let specStr = String(specialStr)
                if let replacedStr = htmlCode[specStr] {
                    result += replacedStr
                    index += specStr.count
                } else {
                    result += String(textChars[index])
                    index += 1
                }
            } else {
                result += String(textChars[index])
                index += 1
            }
        }
        return result
    }
}

class Solution {
    private let htmlCode: [String: String] = [
        "&quot;": "\"",
        "&apos;": "'",
        "&amp;": "&",
        "&gt;": ">",
        "&lt;": "<",
        "&frasl;": "/"
    ]
    private let htmlStart: Character = Character("&")
    private let htmlEnd: Character = Character(";")
    
    func entityParser(_ text: String) -> String {
        let textChars: [Character] = Array(text)
        var result: String = ""
        var index: Int = 0
        while index < textChars.count {
            if textChars[index] == htmlStart {
                replace(&result, &index, textChars)
            } else {
                result += String(textChars[index])
                index += 1
            }
        }
        return result
    }
    
    private func replace(
        _ result: inout String,
        _ index: inout Int,
        _ textChars: [Character]
    ) {
        var specialStr: String = ""
        /// 被替换的字符最多是6个因此最多只需要向后遍历6个字符即可
        for id in 0...6 {
            if id + index < textChars.count {
                specialStr.append(textChars[id + index])
                if textChars[id + index] == htmlEnd {
                    break
                }
            }
        }
        if let replacedStr = htmlCode[specialStr] {
            result += replacedStr
            /// 替换字符后从结尾开始继续遍历
            index += specialStr.count
        } else {
            result += String(textChars[index])
            index += 1
        }
    }
}

let solution = Solution()
assert(
    solution.entityParser(
        "&&&"
    ) == "&&&"
)
assert(
    solution.entityParser(
        "&amp; is an HTML entity but &ambassador; is not."
    ) == "& is an HTML entity but &ambassador; is not."
)

assert(
    solution.entityParser(
        "and I quote: &quot;...&quot;"
    ) == "and I quote: \"...\""
)

assert(
    solution.entityParser(
        "Stay home! Practice on Leetcode :)"
    ) == "Stay home! Practice on Leetcode :)"
)

assert(
    solution.entityParser(
        "x &gt; y &amp;&amp; x &lt; y is always false"
    ) == "x > y && x < y is always false"
)


