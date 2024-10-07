class Solution {
    func minLength(_ s: String) -> Int {
        var stack: [Character] = []
        
        for char in s {
            stack.append(char)
            // Check if the top two characters form "AB" or "CD"
            if stack.count >= 2 {
                let last = stack[stack.count - 1]
                let secondLast = stack[stack.count - 2]
                if (secondLast == "A" && last == "B") || (secondLast == "C" && last == "D") {
                    // Remove the last two characters
                    stack.removeLast(2)
                }
            }
        }
        
        return stack.count
    }
}