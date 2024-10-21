class Solution {
    func maxUniqueSplit(_ s: String) -> Int {
        let chars = Array(s)
        var used = Set<String>()
        return backtrack(chars, 0, &used)
    }
    
    private func backtrack(_ chars: [Character], _ start: Int, _ used: inout Set<String>) -> Int {
        if start == chars.count {
            return 0
        }
        
        var maxCount = 0
        var current = ""
        
        for i in start..<chars.count {
            current.append(chars[i])
            if !used.contains(current) {
                used.insert(current)
                let count = 1 + backtrack(chars, i + 1, &used)
                maxCount = max(maxCount, count)
                used.remove(current)
            }
        }
        
        return maxCount
    }
}
