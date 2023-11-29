class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var answer = 0
        let bits = String(n, radix: 2)
        for bit in bits {
            if bit == "1" {
                answer += 1
            }
        }
        return answer
    }
}
