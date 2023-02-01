class Solution {
    func gcd(_ num1: Int, _ num2: Int) -> Int {
        if num2 == 0 { return num1 }
        else { return gcd(num2, num1 % num2) }
    }
    
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        if (str1 + str2 != str2 + str1) {
            return ""
        }
        let gcdLength: Int = gcd(str1.count, str2.count)
        let index = str1.index(str1.startIndex, offsetBy: gcdLength)
        return str1.substring(to: index)
    }
}
