class Solution {
    func knightDialer(_ n: Int) -> Int {
        let mod = 1000000000 + 7
        var answer = 0
        var dp: [[Int]] = []
        
        for i in 0...n {
            let xArray = [Int](repeating: 0, count: 10)
            dp.append(xArray)
        }
        
        for i in 0...9 {
            dp[0][i] = 1
        }
        
        for i in 1..<n {
            dp[i][0] = (dp[i - 1][4] + dp[i - 1][6]) % mod
            dp[i][1] = (dp[i - 1][8] + dp[i - 1][6]) % mod
            dp[i][2] = (dp[i - 1][7] + dp[i - 1][9]) % mod
            dp[i][3] = (dp[i - 1][4] + dp[i - 1][8]) % mod
            dp[i][4] = (dp[i - 1][0] + dp[i - 1][3] + dp[i - 1][9]) % mod
            dp[i][5] = 0
            dp[i][6] = (dp[i - 1][0] + dp[i - 1][1] + dp[i - 1][7]) % mod
            dp[i][7] = (dp[i - 1][2] + dp[i - 1][6]) % mod
            dp[i][8] = (dp[i - 1][1] + dp[i - 1][3]) % mod
            dp[i][9] = (dp[i - 1][2] + dp[i - 1][4]) % mod
        }
        
        for i in 0...9 {
            answer += dp[n - 1][i]
        }
        
        answer %= mod
        
        return answer
    }
}
