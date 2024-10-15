class Solution {
    func minimumSteps(_ s: String) -> Int {
        var onesToLeft = 0
        var swaps = 0
        let sBytes = [UInt8](s.utf8)
        for byte in sBytes {
            if byte == 49 { // '1'
                onesToLeft += 1
            } else if byte == 48 { // '0'
                swaps += onesToLeft
            }
        }
        return swaps
    }
}