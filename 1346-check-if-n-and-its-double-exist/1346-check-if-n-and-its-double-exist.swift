class Solution {
    func checkIfExist(_ arr: [Int]) -> Bool {
        var dict: [Int: (Int, Bool)] = [:]
        for i in 0..<arr.count {
            dict[arr[i]] = (i, true)
        }
        
        for i in 0..<arr.count {
            let a = arr[i]
            let jd = dict[arr[i] * 2, default: (-1, false)]
            let j = jd.0
            let d = jd.1
            
            if i == j { continue }
            if d {
                return true
            }
        }
        return false
    }
}