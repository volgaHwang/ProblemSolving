class Solution {
    var isVisit: [[Bool]] = []
    var board: [[String]] = []
    var word: [String] = []
    var isOK = false
    
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        if board.count <= 0 { return false }
        let visit = [Bool](repeating: false, count: board[0].count)
        self.word = word.map { String($0) }
        
        for i in 0..<board.count {
            isVisit.append(visit)
        }
        
        for b in board {
            self.board.append(b.map { String($0) })
        }
        
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                if self.board[i][j] == self.word[0], !isOK {
                    isVisit[i][j] = true
                    recur(i, j, 0)
                    isVisit[i][j] = false
                }
            }
        }
        
        return isOK
    }
    
    private func recur(_ x: Int, _ y: Int, _ idx: Int) {
        if isOK {
            return
        }
        if idx >= word.count - 1 {
            isOK = true
            return
        }
        
        for i in 0..<4 {
            let nx = x + dx[i], ny = y + dy[i]
            if nx < 0 || nx >= board.count || ny < 0 || ny >= board[0].count {
                continue
            }
            if isVisit[nx][ny] {
                continue
            }
            if board[nx][ny] != word[idx + 1] {
                continue
            }
            isVisit[nx][ny] = true
            recur(nx, ny, idx + 1)
            isVisit[nx][ny] = false
        }
    }
}