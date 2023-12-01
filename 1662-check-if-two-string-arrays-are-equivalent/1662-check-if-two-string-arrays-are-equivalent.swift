class Solution {
    func arrayStringsAreEqual(_ word1: [String], _ word2: [String]) -> Bool {
        var str1 = "", str2 = ""
        for word in word1 {
            str1 += word
        }
        
        for word in word2 {
            str2 += word
        }
        
        return str1 == str2
    }
}