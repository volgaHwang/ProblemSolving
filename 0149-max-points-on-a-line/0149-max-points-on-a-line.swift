class Solution {
    func maxPoints(_ points: [[Int]]) -> Int {
        guard points.count >= 2 else { return points.count }
        var maxPoints = 0
        
        for i in 0..<points.count {
            var slopes = [String: Int]()
            var maxPointsOnLineThroughI = 0
            let xi = points[i][0]
            let yi = points[i][1]
            
            for j in i+1..<points.count {
                let xj = points[j][0]
                let yj = points[j][1]
                
                var deltaX = xj - xi
                var deltaY = yj - yi
                
                // Handle vertical lines
                if deltaX == 0 {
                    deltaY = 1
                } else if deltaY == 0 {
                    deltaX = 1
                } else {
                    let gcd = computeGCD(deltaX, deltaY)
                    deltaX /= gcd
                    deltaY /= gcd
                    // Normalize signs
                    if deltaX < 0 {
                        deltaX = -deltaX
                        deltaY = -deltaY
                    }
                }
                
                let key = "\(deltaY)/\(deltaX)"
                slopes[key, default: 0] += 1
                maxPointsOnLineThroughI = max(maxPointsOnLineThroughI, slopes[key]!)
            }
            maxPoints = max(maxPoints, maxPointsOnLineThroughI + 1) // +1 to include the point itself
        }
        
        return maxPoints
    }
    
    // Helper function to compute GCD
    func computeGCD(_ a: Int, _ b: Int) -> Int {
        var a = abs(a)
        var b = abs(b)
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        return a
    }
}
