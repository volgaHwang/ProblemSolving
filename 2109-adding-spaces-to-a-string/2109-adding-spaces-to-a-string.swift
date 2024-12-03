class Solution {
    func addSpaces(_ s: String, _ spaces: [Int]) -> String {
        var str = ""
        var index = 0
        var sIndex = 0
        for c in s {
            if sIndex >= spaces.count {
                str += String(c)
                index += 1
                continue
            }
            if spaces[sIndex] == index {
                str += " " + String(c)
                sIndex += 1
            } else {
                str += String(c)
            }
            
            index += 1
        }
        return str
    }
}