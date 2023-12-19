class Solution {
    func imageSmoother(_ img: [[Int]]) -> [[Int]] {
        let m = img.count
        let n = img[0].count
        
        // Create the integral image
        var integralImg = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
        for i in 1...m {
            for j in 1...n {
                integralImg[i][j] = img[i-1][j-1] + integralImg[i-1][j] + integralImg[i][j-1] - integralImg[i-1][j-1]
            }
        }
        
        // Create smoothed image using the integral image
        var smoothImg = Array(repeating: Array(repeating: 0, count: n), count: m)
        for i in 0..<m {
            for j in 0..<n {
                // Define the corners of the rectangle
                let x1 = max(i-1, 0)
                let y1 = max(j-1, 0)
                let x2 = min(i+1, m-1)
                let y2 = min(j+1, n-1)
                
                // Calculate the number of cells in the rectangle
                let count = (x2 - x1 + 1) * (y2 - y1 + 1)
                
                // Use the integral image to compute the sum
                let sum = integralImg[x2+1][y2+1] - integralImg[x1][y2+1] - integralImg[x2+1][y1] + integralImg[x1][y1]
                
                // Calculate the average and update the smooth image
                smoothImg[i][j] = sum / count
            }
        }
        
        return smoothImg
    }
}
