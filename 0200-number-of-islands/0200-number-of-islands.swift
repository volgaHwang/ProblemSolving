class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        let row = grid.count, col = grid[0].count
        let dx = [0,0,1,-1], dy = [1,-1,0,0]
        var answer = 0
        var visit = [[Bool]](repeating: [Bool](repeating: false, count: col), count: row)

        for i in 0..<row {
            for j in 0..<col {
                if grid[i][j] == "1", visit[i][j] == false {
                    visit[i][j] = true
                    bfs(x: i, y: j)
                    answer += 1
                }
            }
        }

        func bfs(x: Int, y: Int) {
            var q: [(x: Int, y: Int)] = [(x, y)], front = 0
            while q.count > front {
                let now = q[front]
                front += 1
                for i in 0..<4 {
                    let nx = now.x + dx[i], ny = now.y + dy[i]
                    if nx < 0 || nx >= row || ny < 0 || ny >= col {
                        continue
                    }
                    if visit[nx][ny] {
                        continue
                    }
                    if grid[nx][ny] == "0" {
                        continue
                    }
                    visit[nx][ny] = true
                    q.append((nx, ny))
                }
            }
        }
        return answer
    }

}