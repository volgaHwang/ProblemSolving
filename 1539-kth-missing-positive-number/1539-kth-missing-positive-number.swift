class Solution {
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        if arr.count == 1 {
            if arr[0] < k {
                return k + 1
            } else if arr[0] > k {
                return k
            }
        }
        var s = 0, e = arr.count - 1
        if arr[e] - arr.count < k {
            return arr[e] + (k - arr[e] + arr.count)
        }
        if arr[s] > k {
            return k
        }
        while s < e {
            let m = (s + e) / 2
            let left = arr[m] - (m + 1)
            let right = arr[m + 1] - (m + 2)
            if left < k, right >= k {
                return arr[m] + k - left
            }
            if right < k {
                s = m + 1
            } else {
                e = m
            }
        }
        return 0
    }
}