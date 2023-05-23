import Foundation

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var results: [Int] = []
        var assist: [Int] = []
        
        var digits_reversed = digits.reversed()
        var digists_length = digits.count
        
        var id: Int = 0
        
        for digit in digits_reversed {
            if (id == 0) {
                if digit == 9 {
                    assist.append(1)
                    results.append(0)
                } else {
                    assist.append(0)
                    results.append(digit + 1)
                }
            } else {
                if assist[id-1] == 1 {
                    if digit != 9 {
                        results.append(digit + 1)
                        assist[id-1] == 0
                        assist.append(0)
                    } else {
                        results.append(0)
                        assist[id-1] == 0
                        assist.append(1)
                    }
                } else {
                    results.append(digit)
                    assist.append(0)
                }
            }
            id += 1
        }
        
        if let last = assist.last {
            if last == 1 {
                results.append(1)
            }
        }
        
        return results.reversed()
    }
}

let solution = Solution()
print(solution.plusOne([9,9,9]))
print(solution.plusOne([4,3,2,1]))
print(solution.plusOne([0]))
print(solution.plusOne([9]))
print(solution.plusOne([1,2,3,9]))
print(solution.plusOne([7,2,8,5,0,9,1,2,9,5,3,6,6,7,3,2,8,4,3,7,9,5,7,7,4,7,4,9,4,7,0,1,1,1,7,4,0,0,7]))


