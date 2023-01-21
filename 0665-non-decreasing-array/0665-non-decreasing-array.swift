import Foundation

class Solution {
    let INF = 10000
    func checkPossibility(_ nums: [Int]) -> Bool {
        if nums.count <= 1 { return true }
        var nums = [-INF] + nums, idx = -1
        nums.append(INF)
        let limit = nums.count - 1
        
        for i in 1..<limit {
            if nums[i] > nums[i + 1] {
                if idx != -1 { return false }
                idx = i
            }
        }
        
        if idx == -1 { return true }
        return (nums[idx] <= nums[idx + 2]) || (nums[idx - 1] <= nums[idx + 1])
    }
}
