class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        let row = grid.count, col = grid[0].count
        let dx = [0,0,1,-1], dy = [1,-1,0,0]
        var answer = 0
        var visit: [[Int]] = [[Int]](repeating: [Int](repeating: -1, count: col), count: row)
        var q: [(x: Int, y: Int)] = [], remain: [(x: Int, y: Int)] = []
        var front = 0

        for i in 0..<row {
            for j in 0..<col {
                if grid[i][j] != 0 {
                    remain.append((i, j))
                    visit[i][j] = 0
                }
            }
        }

        for posi in remain {
            if visit[posi.x][posi.y] > 0 {
                continue
            }
            if grid[posi.x][posi.y] == 0 {
                continue
            }
            visit[posi.x][posi.y] = 1

            q.append((posi.x, posi.y))
            
            while q.count > front {
                let now = q[front]
                var ad = 4
                front += 1
                for i in 0..<4 {
                    let nx = now.x + dx[i], ny = now.y + dy[i]
                    if nx < 0 || nx >= row || ny < 0 || ny >= col {
                        continue
                    }
                    if grid[nx][ny] == 0 {
                        continue
                    }
                    if visit[nx][ny] == 1 {
                        ad -= 1
                        continue
                    }
                    if grid[nx][ny] == 1 {
                        ad -= 1
                    }
                    visit[nx][ny] = 1
                    q.append((nx, ny))
                }
                answer += ad
            }
        }

        return answer
    }
}