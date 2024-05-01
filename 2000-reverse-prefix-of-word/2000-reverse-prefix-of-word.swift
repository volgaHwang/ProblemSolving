class Solution {
    func reversePrefix(_ word: String, _ ch: Character) -> String {
        var first: String = ""
        var last: String = ""
        var isFind = false
        for w in word {
            if !isFind {
                first = String(w) + first
                isFind = (w == ch)
            } else {
                last += String(w)
            }
        }
        if !isFind {
            return word
        }
        return first + last
    }
}