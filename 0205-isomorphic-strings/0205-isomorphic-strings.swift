class Solution {    
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        let s1 = isMorphic(s, t)
        let s2 = isMorphic(t, s)
        
        return s1 && s2
    }
    
    private func isMorphic(_ s: String, _ t: String) -> Bool {
        var dict: [String: String] = [:]
        let str1 = s.map { String($0) }
        let str2 = t.map { String($0) }
        
        if str1.count != str2.count {
            return false
        }
        
        for i in 0..<str1.count {
            if dict[str1[i]] != nil, dict[str1[i], default: ""] != str2[i] {
                return false
            }
            dict[str1[i]] = str2[i]
        }
        
        return true
    }
}