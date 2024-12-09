class Solution {
    func isArraySpecial(_ nums: [Int], _ queries: [[Int]]) -> [Bool] {
        var answer: [Bool] = []
        var ll: [Bool] = []
        var rr: [Int] = []
        
        for i in 0..<nums.count {
            if i == 0 {
                ll.append(true)
                continue
            }
            ll.append(isEven(nums[i]) != isEven(nums[i - 1]))
        }
        
        var m = 0
        for i in 0..<ll.count {
            if ll[i] == false {
                m = i
            }
            rr.append(m)
        }
        
        for q in queries {
            let i = q[0]
            let j = q[1]
            
            let left = rr[i], right = rr[j]
            answer.append(left == right)
        }
        return answer
    }
    
    func isEven(_ v: Int) -> Bool {
        return (v % 2 == 0)
    }
}