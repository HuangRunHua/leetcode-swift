import Foundation

class Solution {
    // total: 0 ms
    func mySqrt(_ x: Int) -> Int {
        if (x == 1) {
            return 1
        }
        var left: Int = 0
        var right: Int = x
        var middle = Int((left+right)/2)
        
        while ((middle*middle > x) || (middle+1)*(middle+1) <= x) {
            
            if (middle*middle > x) {
                right = middle
            } else if (middle*middle < x) {
                left = middle
            }
            middle = Int((left+right)/2)
        }
        return middle
    }
}

let solution = Solution()
print(solution.mySqrt(49))
//print(solution.mySqrt(4))
print(solution.mySqrt(9))
