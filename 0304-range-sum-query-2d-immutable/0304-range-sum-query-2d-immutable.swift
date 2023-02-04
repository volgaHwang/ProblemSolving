class NumMatrix {
    var matrix: [[Int]] = []
    var summed: [[Int]] = []
    init(_ matrix: [[Int]]) {
        self.matrix = matrix
        let n = matrix.count
        let m = matrix[0].count
        summed = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
        for i in 0..<n {            
            for j in 0..<m {
                if j == 0 {
                    summed[i][j] = matrix[i][j]
                } else {
                    summed[i][j] = summed[i][j - 1] + matrix[i][j]
                }
            }
        }

        for i in 0..<m {
            for j in 1..<n {
                summed[j][i] += summed[j - 1][i]
            }
        }        
    }

    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        
        return summed[row2][col2] - (row1 - 1 >= 0 ? summed[row1 - 1][col2]: 0) - (col1 - 1 >= 0 ? summed[row2][col1 - 1]: 0)
        + ((row1 - 1 < 0) || (col1 - 1 < 0) ? 0: summed[row1 - 1][col1 - 1])
    }
}

/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */