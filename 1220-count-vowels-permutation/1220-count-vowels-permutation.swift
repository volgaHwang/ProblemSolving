import Foundation

class Solution {
    let INF = 1000000000 + 7
    var dp: [[Int]] = []
    func countVowelPermutation(_ n: Int) -> Int {
        dp = [[Int]](repeating: [Int](repeating: 0, count: 5), count: n + 2)
        for i in 0..<5 { dp[1][i] = 1 }
        
        for i in stride(from: 2, to: n + 1, by: 1) {
            dp[i][0] = (dp[i - 1][1] + dp[i - 1][4] + dp[i - 1][2]) % INF
            dp[i][1] = (dp[i - 1][0] + dp[i - 1][2]) % INF
            dp[i][2] = (dp[i - 1][1] + dp[i - 1][3]) % INF
            dp[i][3] = dp[i - 1][2] % INF
            dp[i][4] = (dp[i - 1][3] + dp[i - 1][2]) % INF
        }
        
        return (dp[n][0] + dp[n][1] + dp[n][2] + dp[n][3] + dp[n][4]) % INF
    }
}
