class Solution {
    func tribonacci(_ n: Int) -> Int {
        var arr = [Int](repeating: 0, count: 40)
        arr[0] = 0; arr[1] = 1; arr[2] = 1
        
        if n >= 3 {
            for i in 3...n {
                arr[i] = arr[i - 3] + arr[i - 2] + arr[i - 1]
            }
        }
        
        return arr[n]
    }
}