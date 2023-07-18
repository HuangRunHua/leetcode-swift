import Foundation

class Solution {
    
    // total: 4 ms
    func climbStairs(_ n: Int) -> Int {
        
        if n == 1 {
            return 1
        }
        
        if n == 2 {
            return 2
        }
        
        var result: Int = 0
        var result_list: [Int] = [1, 2]
        for i in 0..<n-2 {
            result_list.append(result_list[i] + result_list[i+1])
            result = result_list[i] + result_list[i+1]
        }
                
        return result
    }
}

let solution = Solution()
print(solution.climbStairs(2))
print(solution.climbStairs(3))
print(solution.climbStairs(4))
print(solution.climbStairs(5))
