class Solution {
    func isArraySpecial(_ nums: [Int], _ queries: [[Int]]) -> [Bool] {
        let n = nums.count
        // bad[i]: nums[i]와 nums[i+1]의 홀짝성이 같다면 1, 아니면 0
        // bad 배열의 크기는 n-1
        var bad = [Int](repeating: 0, count: n-1)
        
        for i in 0..<n-1 {
            // 홀짝 비교: (nums[i] & 1) == (nums[i+1] & 1)
            bad[i] = ((nums[i] & 1) == (nums[i+1] & 1)) ? 1 : 0
        }
        
        // prefix sum 준비
        // prefix[i]: bad[0] ~ bad[i-1]까지의 합
        var prefix = [Int](repeating: 0, count: n)
        for i in 1..<n {
            prefix[i] = prefix[i-1] + bad[i-1]
        }

        var result = [Bool]()
        result.reserveCapacity(queries.count)
        
        for q in queries {
            let l = q[0], r = q[1]
            // [l..r]구간에서 bad pair 개수 = prefix[r] - prefix[l]
            // bad pair가 0이면 special
            let count = prefix[r] - prefix[l]
            result.append(count == 0)
        }
        
        return result
    }
}
