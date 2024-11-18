class Solution {
    func decrypt(_ code: [Int], _ k: Int) -> [Int] {
        var answer: [Int] = []
        let total = code.count
        for i in 0..<code.count {
            if k >= 0 {
                var appendValue = 0
                for j in 0..<k {
                    let newIndex = (i + j + 1) % (total)
                    appendValue += code[newIndex]
                }
                answer.append(appendValue)
            } else {
                var appendValue = 0
                let K = -k
                for j in 0..<K {
                    let newId = (i - j - 1)
                    let newIndex = newId < 0 ? total + newId : newId
                    appendValue += code[newIndex]
                }
                answer.append(appendValue)
            }
        }
        return answer
    }
}