class Solution {
    func imageSmoother(_ img: [[Int]]) -> [[Int]] {
        let m = img.count
        let n = img[0].count

        var smoothImg = Array(repeating: Array(repeating: 0, count: n), count: m)

        for i in 0..<m {
            for j in 0..<n {
                var sum = 0
                var count = 0

                for x in max(i-1, 0)...min(i+1, m-1) {
                    for y in max(j-1, 0)...min(j+1, n-1) {
                        sum += img[x][y]
                        count += 1
                    }
                }

                smoothImg[i][j] = sum / count
            }
        }

        return smoothImg
    }
}
