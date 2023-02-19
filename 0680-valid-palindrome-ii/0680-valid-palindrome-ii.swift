class Solution {
    func valid(_ c: [Character]) -> (left: Int, right: Int)? {
        var left = 0, right = c.count - 1
        while left < right {
            if c[left] != c[right] { return (left, right) }
            left += 1
            right -= 1
        }
        return nil
    }

    func validPalindrome(_ s: String) -> Bool {
        var c: [Character] = Array(s)
        guard let op = valid(c) else {
            return true
        }
        var lef = c, rig = c
        lef.remove(at: op.left)
        rig.remove(at: op.right)
        return valid(lef) == nil || valid(rig) == nil
    }
}