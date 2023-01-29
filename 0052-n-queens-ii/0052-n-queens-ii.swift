class Solution {
    var n: Int = 0
    var r: [Bool] = []
    var c: [Bool] = []
    var rc: [Bool] = [] // 우 하
    var cr: [Bool] = [] // 좌 상
    var answer = 0
    
    func recur(_ x: Int) {
        if x == n {
            answer += 1
            return
        }
        for i in 0..<n {
            if r[x] == false, c[i] == false, rc[n - (x - i)] == false, cr[x + i] == false {
                r[x] = true
                c[i] = true
                rc[n - (x - i)] = true
                cr[x + i] = true
                recur(x + 1)
                r[x] = false
                c[i] = false
                rc[n - (x - i)] = false
                cr[x + i] = false
            }
        }
    }
    
    func totalNQueens(_ n: Int) -> Int {
        r = [Bool](repeating: false, count: n)
        c = [Bool](repeating: false, count: n)
        rc = [Bool](repeating: false, count: n * 2)
        cr = [Bool](repeating: false, count: n * 2)
        self.n = n
        
        recur(0)
        
        return answer
    }
}