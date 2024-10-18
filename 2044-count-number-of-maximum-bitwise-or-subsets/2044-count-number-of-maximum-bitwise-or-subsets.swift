class Solution {
    func countMaxOrSubsets(_ nums: [Int]) -> Int {
        var maxOr = 0
        var count = 0
        
        // Total number of subsets is 2^n - 1 (excluding the empty subset)
        let totalSubsets = 1 << nums.count
        
        // Iterate over all possible subsets
        for subset in 1..<totalSubsets {
            var currentOr = 0
            for i in 0..<nums.count {
                // Check if the i-th element is included in the subset
                if (subset & (1 << i)) != 0 {
                    currentOr |= nums[i]
                }
            }
            // Update maxOr and count accordingly
            if currentOr > maxOr {
                maxOr = currentOr
                count = 1
            } else if currentOr == maxOr {
                count += 1
            }
        }
        
        return count
    }
}
