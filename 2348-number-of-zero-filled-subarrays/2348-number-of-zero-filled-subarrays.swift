class Solution {
    func zeroFilledSubarray(_ nums: [Int]) -> Int {
        var left = 0, right = 0
        var i = 0, sum = 0
        while i  < nums.count {
            if nums[i] == 0 {
                right = i
                var cnt = 0
                while right < nums.count, nums[right] == 0  {
                    right += 1
                    cnt += 1
                }
                i = right
                sum += sumS(cnt)
            }
            i += 1
        }
        return sum
    }

    func sumS(_ v : Int) -> Int {
        return ((1 + v) * v) / 2
    }
}