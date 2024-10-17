class Solution {
    func maximumSwap(_ num: Int) -> Int {
        // 숫자를 문자열로 변환하고, 문자 배열로 변환
        var numArray = Array(String(num))
        let n = numArray.count
        
        // 각 숫자의 마지막 등장 인덱스를 저장할 배열 생성 (0-9)
        var lastIndices = [Int](repeating: -1, count: 10)
        for (i, char) in numArray.enumerated() {
            if let digit = char.wholeNumberValue {
                lastIndices[digit] = i
            }
        }
        
        // 각 자리수를 순회하며 가능한 최적의 교환을 찾기
        for i in 0..<n {
            // 현재 자리의 숫자
            if let currentDigit = numArray[i].wholeNumberValue {
                // 현재 자리보다 큰 숫자를 9부터 탐색
                for d in stride(from: 9, through: currentDigit + 1, by: -1) {
                    let j = lastIndices[d]
                    if j > i {
                        // 교환 수행
                        numArray.swapAt(i, j)
                        // 교환 후 숫자로 변환하여 반환
                        return Int(String(numArray))!
                    }
                }
            }
        }
        
        // 교환이 불가능한 경우 원래 숫자 반환
        return num
    }
}