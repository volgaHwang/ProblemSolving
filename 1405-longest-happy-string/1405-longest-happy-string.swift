class Solution {
    func longestDiverseString(_ a: Int, _ b: Int, _ c: Int) -> String {
        var result = ""
        var countA = a
        var countB = b
        var countC = c
        var lastChar = ""
        var lastCount = 0

        while true {
            var candidates = [("a", countA), ("b", countB), ("c", countC)]
            // 정렬을 하지 않고, 남은 개수가 많은 순서로 직접 비교
            candidates.sort { $0.1 > $1.1 }
            var found = false

            for (char, count) in candidates {
                if count == 0 {
                    continue
                }
                if lastChar == char && lastCount == 2 {
                    continue
                }
                // 문자 추가
                result.append(char)
                if char == "a" {
                    countA -= 1
                } else if char == "b" {
                    countB -= 1
                } else if char == "c" {
                    countC -= 1
                }
                if lastChar == char {
                    lastCount += 1
                } else {
                    lastChar = char
                    lastCount = 1
                }
                found = true
                break
            }

            if !found {
                break
            }
        }

        return result
    }
}