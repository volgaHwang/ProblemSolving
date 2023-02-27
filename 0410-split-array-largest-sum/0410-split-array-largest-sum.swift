class Solution {
    func splitArray(_ nums: [Int], _ m: Int) -> Int {
    var left = nums.max() ?? 0
    var right = nums.reduce(0, +)
    
    while left < right {
            let mid = (left + right) / 2
            var sum = 0
            var count = 1
        
            for num in nums {
                if sum + num > mid {
                    sum = num
                    count += 1
                } else {
                    sum += num
                }
            }
        
            if count > m {
                left = mid + 1
            } else {
                right = mid
            }
        }
    
        return left
    }
}