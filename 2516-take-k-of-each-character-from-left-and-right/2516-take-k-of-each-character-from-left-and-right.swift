class Solution {
    func takeCharacters(_ s: String, _ k: Int) -> Int {
        var totalCounts = [Character: Int]()
        for char in s {
            totalCounts[char, default: 0] += 1
        }
        
        // 'a', 'b', 'c' 각각에 대해 개수 확인
        for char in ["a", "b", "c"] {
            let character = Character(char)
            if totalCounts[character, default: 0] < k {
                return -1
            }
        }
        
        let n = s.count
        if k == 0 {
            return 0
        }
        
        var counts = [Character: Int]()
        var maxLength = 0
        var left = 0
        let characters = Array(s)
        
        for right in 0..<n {
            let rightChar = characters[right]
            counts[rightChar, default: 0] += 1
            
            // 조건을 만족하지 않을 경우 윈도우 축소
            while counts[rightChar]! > totalCounts[rightChar]! - k {
                let leftChar = characters[left]
                counts[leftChar]! -= 1
                left += 1
            }
            
            maxLength = max(maxLength, right - left + 1)
        }
        
        return n - maxLength
    }
}
