class Solution {
    func maxDepth(_ s: String) -> Int {
        var r = 0, p = 0
        for c in s {
            if c == "(" {
                p += 1
                r = max(r, p)
            } else if c == ")" {
                p -= 1                
            }
        }
        return r
    }
}