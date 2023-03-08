class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        if piles.count == 1 { 
            for k in 1...h {
                let s = (piles[0] / k) + (piles[0] % k == 0 ? 0: 1)
                if s <= h { return k }
            }
        }
        var s = 0, e = 1000000000
        while s < e {
            let m = (s + e) / 2
            var sum = 0
            for i in 0..<piles.count {
                sum += (piles[i] / m) + (piles[i] % m == 0 ? 0: 1)
            }
            if sum > h {
                s = m + 1
            } else {
                e = m
            }
        }
        return e
    }
}