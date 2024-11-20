class Solution {
    func takeCharacters(_ s: String, _ k: Int) -> Int {
        let n = s.count
        let sArray = Array(s)
        
        // 총 문자 개수 계산
        var totalCounts = [Int](repeating: 0, count: 3)
        for char in sArray {
            let idx = index(char)
            totalCounts[idx] += 1
        }
        
        // 각 문자의 총 개수가 k보다 작은 경우 -1 반환
        for count in totalCounts {
            if count < k {
                return -1
            }
        }
        
        // k가 0인 경우 0 반환
        if k == 0 {
            return 0
        }
        
        // 슬라이딩 윈도우를 사용하여 최대 부분 문자열 찾기
        var counts = [Int](repeating: 0, count: 3)
        var left = 0
        var maxLength = 0
        
        for right in 0..<n {
            let rightCharIdx = index(sArray[right])
            counts[rightCharIdx] += 1
            
            // 조건을 만족하지 않을 경우 윈도우 축소
            while counts[rightCharIdx] > totalCounts[rightCharIdx] - k {
                let leftCharIdx = index(sArray[left])
                counts[leftCharIdx] -= 1
                left += 1
            }
            
            maxLength = max(maxLength, right - left + 1)
        }
        
        return n - maxLength
    }
    
    // 'a'를 0, 'b'를 1, 'c'를 2로 매핑하는 함수
    private func index(_ char: Character) -> Int {
        switch char {
        case "a":
            return 0
        case "b":
            return 1
        case "c":
            return 2
        default:
            return -1 // 오류 발생 시 기본값
        }
    }
}
