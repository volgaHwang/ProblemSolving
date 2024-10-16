class Solution {
    func minStartingIndex(_ s: String, _ pattern: String) -> Int {
        let sArray = Array(s)
        let pArray = Array(pattern)
        let n = sArray.count
        let m = pArray.count

        if m >= n {
            return -1
        }

        for i in 0...(n - m) {
            var mismatchCount = 0
            for j in 0..<m {
                if sArray[i + j] != pArray[j] {
                    mismatchCount += 1
                    if mismatchCount > 1 {
                        break
                    }
                }
            }
            if mismatchCount <= 1 {
                return i
            }
        }

        return -1
    }
}