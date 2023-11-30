class Solution {
    func minimumOneBitOperations(_ n: Int) -> Int {
        var answer = n
        
        answer ^= answer >> 16
        answer ^= answer >> 8
        answer ^= answer >> 4
        answer ^= answer >> 2
        answer ^= answer >> 1
        return answer
    }
}