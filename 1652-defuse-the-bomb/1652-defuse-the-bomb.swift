class Solution {
    func decrypt(_ code: [Int], _ k: Int) -> [Int] {
        let n = code.count
        var answer = [Int](repeating: 0, count: n)
        
        if k == 0 {
            return answer
        }
        
        var windowSum = 0
        let absK = abs(k)
        
        if k > 0 {
            // 초기 윈도우 합 계산
            for i in 1...k {
                windowSum += code[i % n]
            }
            answer[0] = windowSum
            
            // 슬라이딩 윈도우 이동
            for i in 1..<n {
                windowSum += code[(i + k) % n]
                windowSum -= code[i]
                answer[i] = windowSum
            }
        } else {
            // k < 0인 경우, 이전 abs(k)개의 합
            // 초기 윈도우 합 계산
            for i in 0..<absK {
                windowSum += code[(n - absK + i) % n]
            }
            answer[0] = windowSum
            
            // 슬라이딩 윈도우 이동
            for i in 1..<n {
                windowSum += code[(i - 1) % n]
                windowSum -= code[(n - absK + i - 1) % n]
                answer[i] = windowSum
            }
        }
        
        return answer
    }
}