class Solution {
    func canChange(_ start: String, _ target: String) -> Bool {
        let n = start.count
        let startArr = Array(start)
        let targetArr = Array(target)
        
        // 1. L, R 순서 및 개수 비교
        var startPieces = [Character]()
        var targetPieces = [Character]()
        
        for i in 0..<n {
            if startArr[i] != "_" {
                startPieces.append(startArr[i])
            }
            if targetArr[i] != "_" {
                targetPieces.append(targetArr[i])
            }
        }
        
        if startPieces != targetPieces {
            return false
        }
        
        // 2. R, L의 인덱스 추출
        var startRPos = [Int]()
        var targetRPos = [Int]()
        var startLPos = [Int]()
        var targetLPos = [Int]()
        
        for i in 0..<n {
            if startArr[i] == "R" {
                startRPos.append(i)
            }
            if targetArr[i] == "R" {
                targetRPos.append(i)
            }
            if startArr[i] == "L" {
                startLPos.append(i)
            }
            if targetArr[i] == "L" {
                targetLPos.append(i)
            }
        }
        
        // 3. R 조건 확인: start_R[i] <= target_R[i]
        for i in 0..<startRPos.count {
            if startRPos[i] > targetRPos[i] {
                return false
            }
        }
        
        // 4. L 조건 확인: start_L[i] >= target_L[i]
        for i in 0..<startLPos.count {
            if startLPos[i] < targetLPos[i] {
                return false
            }
        }
        
        return true
    }
}
