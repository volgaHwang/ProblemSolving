class Solution {
    func hasAllCodes(_ s: String, _ k: Int) -> Bool {
        if s.count <= k {
            return false
        }
        let sArray = Array(s)
        var index = 0, value = 0
        let mask = (1 << k) - 1, startPoint = k - 1
        var setItem = Set<Int>()
        while index < sArray.count {
            value = (value << 1)
            if sArray[index] == "0" {
                value += 0
            } else {
                value += 1
            }
            value &= mask
            if index >= startPoint {
                setItem.insert(value)
            }
            index += 1
        }
        
        return setItem.count == (1 << k)
    }
}