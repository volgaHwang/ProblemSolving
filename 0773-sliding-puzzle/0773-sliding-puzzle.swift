class Solution {
    func slidingPuzzle(_ board: [[Int]]) -> Int {
        let target = "123450"
        let dirs = [(-1,0),(1,0),(0,-1),(0,1)] // 상, 하, 좌, 우 방향
        var start = ""
        
        // 현재 보드 상태를 문자열로 변환
        for row in board {
            for num in row {
                start += "\(num)"
            }
        }
        
        // 0의 위치를 Int로 변환하여 저장
        let zeroIndex = start.firstIndex(of: "0")!
        let zeroPos = start.distance(from: start.startIndex, to: zeroIndex)
        
        // 큐 초기화: (현재 상태, 빈칸의 인덱스(Int), 이동 횟수)
        var queue = [(start, zeroPos, 0)]
        var visited = Set<String>()
        visited.insert(start)
        
        while !queue.isEmpty {
            let (state, zeroPos, step) = queue.removeFirst()
            if state == target {
                return step
            }
            let x = zeroPos / 3
            let y = zeroPos % 3
            for dir in dirs {
                let newX = x + dir.0
                let newY = y + dir.1
                if newX >= 0 && newX < 2 && newY >= 0 && newY < 3 {
                    var chars = Array(state)
                    let newPos = newX * 3 + newY
                    chars.swapAt(zeroPos, newPos)
                    let newState = String(chars)
                    if !visited.contains(newState) {
                        visited.insert(newState)
                        queue.append((newState, newPos, step + 1))
                    }
                }
            }
        }
        return -1
    }
}
