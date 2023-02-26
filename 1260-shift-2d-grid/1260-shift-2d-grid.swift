class Solution {
    func shiftGrid(_ g: [[Int]], _ k: Int) -> [[Int]] {
        if k == 0 { return g }
        let row = g.count, col = g[0].count
        var grid = g
        for r in 0..<row {
            for c in 0..<col {
                let rw1 = (r + (c + k) / col) % row
                let cl1 = (c + k) % col
                grid[rw1][cl1] = g[r][c]
            }
        }
        return grid
    }
}