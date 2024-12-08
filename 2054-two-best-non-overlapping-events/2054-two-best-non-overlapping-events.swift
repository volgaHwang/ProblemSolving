class Solution {
    func maxTwoEvents(_ events: [[Int]]) -> Int {
        let sortedEvents = events.sorted { $0[1] < $1[1] }
        
        let endTimes = sortedEvents.map { $0[1] }
        let values = sortedEvents.map { $0[2] }
        
        var prefixMax = Array(repeating: 0, count: sortedEvents.count)
        
        var currentMax = 0
        for i in 0..<sortedEvents.count {
            currentMax = max(currentMax, values[i])
            prefixMax[i] = currentMax
        }
        
        var result = 0
        
        for i in 0..<sortedEvents.count {
            let start = sortedEvents[i][0]
            let val = sortedEvents[i][2]
            
            let idx = binarySearch(endTimes, start - 1)
            
            let previousMax = (idx >= 0) ? prefixMax[idx] : 0
            let candidate = val + previousMax
            result = max(result, candidate)
        }
        
        result = max(result, prefixMax.last ?? 0)
        
        return result
    }
    
    private func binarySearch(_ arr: [Int], _ target: Int) -> Int {
        var left = 0
        var right = arr.count - 1
        var answer = -1
        while left <= right {
            let mid = (left + right) / 2
            if arr[mid] <= target {
                answer = mid
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return answer
    }
}
