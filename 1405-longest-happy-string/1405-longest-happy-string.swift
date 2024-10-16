class Solution {
    func longestDiverseString(_ a: Int, _ b: Int, _ c: Int) -> String {
        var result = ""
        var counts = [("a", a), ("b", b), ("c", c)]
        var lastChar = ""
        var lastCount = 0

        while true {
            // 개수를 기준으로 내림차순 정렬
            counts.sort { $0.1 > $1.1 }
            var hasNext = false

            for i in 0..<counts.count {
                let (char, count) = counts[i]
                if count == 0 {
                    continue
                }
                if lastChar == char && lastCount == 2 {
                    continue
                }

                // 결과 문자열에 문자 추가
                result.append(char)
                counts[i].1 -= 1

                if lastChar == char {
                    lastCount += 1
                } else {
                    lastChar = char
                    lastCount = 1
                }

                hasNext = true
                break
            }

            if !hasNext {
                break
            }
        }

        return result
    }
}