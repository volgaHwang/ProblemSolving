class Solution {
    func minOperations(_ nums: [Int], _ k: Int) -> Int {
        var finalXor = 0
        
        // 배열의 모든 정수에 대한 XOR 연산
        for n in nums {
            finalXor = finalXor ^ n
        }
        
        var count = 0
        var tempK = k
        var tempFinalXor = finalXor
        
        // tempK 또는 tempFinalXor 중 하나라도 0이 될 때까지 반복
        while tempK != 0 || tempFinalXor != 0 {
            if (tempK % 2) != (tempFinalXor % 2) {
                count += 1
            }
            
            // 두 정수에서 마지막 비트를 제거
            tempK /= 2
            tempFinalXor /= 2
        }
        
        return count
    }
}