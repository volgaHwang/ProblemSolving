class Solution {
    var CtoIdict: [Character: Int] = [:]
    var ItoCdict: [Int: Character] = [:]
    let alp = "abcdefghijklmnopqrstuvwxyz"
    func makeDict() {
        var value = 0
        for a in alp {
            CtoIdict[a] = value
            ItoCdict[value] = a
            value += 1
        }
    }
    
    func canMakeSubsequence(_ str1: String, _ str2: String) -> Bool {
        makeDict()
        var str = Array(str2)
        var index = 0
        for a in str1 {
            let idx = CtoIdict[a, default: 0] + 1
            let b = idx == (alp.count) ? ItoCdict[0, default: "a"] : ItoCdict[idx, default: "a"]
            if index >= str.count {
                return true
            }
            if a == str[index] || b == str[index] {
                index += 1
            }
        }
        return index == str.count
    }
}