class Solution {
    func checkIfExist(_ arr: [Int]) -> Bool {
        var numSet = Set<Int>()
        var zeroCount = 0
        
        for num in arr {
            if num == 0 {
                zeroCount += 1
            }
            numSet.insert(num)
        }
        
        if zeroCount >= 2 {
            return true
        }
        
        for num in arr {
            if num != 0 && numSet.contains(num * 2) {
                return true
            }
        }
        
        return false
    }
}
