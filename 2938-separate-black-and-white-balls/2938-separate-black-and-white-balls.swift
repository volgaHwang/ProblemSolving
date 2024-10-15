class Solution {
    func minimumSteps(_ s: String) -> Int {
        var zerosToRight = 0
        var swaps = 0
        let characters = Array(s)
        for i in stride(from: characters.count - 1, through: 0, by: -1) {
            if characters[i] == "0" {
                zerosToRight += 1
            } else if characters[i] == "1" {
                swaps += zerosToRight
            }
        }
        return swaps
    }
}