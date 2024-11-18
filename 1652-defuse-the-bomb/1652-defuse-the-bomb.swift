class Solution {
    func decrypt(_ code: [Int], _ k: Int) -> [Int] {
        let n = code.count
        var answer = [Int](repeating: 0, count: n)
        
        if k == 0 {
            return answer
        }
        
        // 확장된 배열을 만들어서 원형을 처리하기 쉽게 함
        let extendedCode = code + code
        var windowSum = 0
        let absK = abs(k)
        
        if k > 0 {
            // 초기 윈도우 합 계산
            for i in 1...k {
                windowSum += extendedCode[i]
            }
            answer[0] = windowSum
            
            // 슬라이딩 윈도우 이동
            for i in 1..<n {
                windowSum += extendedCode[i + k]
                windowSum -= extendedCode[i]
                answer[i] = windowSum
            }
        } else {
            // k < 0인 경우, 이전 abs(k)개의 합
            // 초기 윈도우 합 계산
            for i in 0..<absK {
                windowSum += extendedCode[n - absK + i]
            }
            answer[0] = windowSum
            
            // 슬라이딩 윈도우 이동
            for i in 1..<n {
                windowSum += extendedCode[i - 1]
                windowSum -= extendedCode[n - absK + i - 1]
                answer[i] = windowSum
            }
        }
        
        return answer
    }
}