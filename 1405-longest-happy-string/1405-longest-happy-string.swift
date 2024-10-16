class Solution {
    func longestDiverseString(_ a: Int, _ b: Int, _ c: Int) -> String {
        var result = ""
        var countA = a
        var countB = b
        var countC = c

        var lastChar: Character = " "
        var lastCount = 0

        while true {
            var charToAppend: Character? = nil

            // 가장 많은 개수를 가진 문자 선택
            if (countA >= countB && countA >= countC && countA > 0 && (lastChar != "a" || lastCount < 2)) {
                charToAppend = "a"
            } else if (countB >= countA && countB >= countC && countB > 0 && (lastChar != "b" || lastCount < 2)) {
                charToAppend = "b"
            } else if (countC >= countA && countC >= countB && countC > 0 && (lastChar != "c" || lastCount < 2)) {
                charToAppend = "c"
            } else if (countA > 0 && (lastChar != "a" || lastCount < 2)) {
                charToAppend = "a"
            } else if (countB > 0 && (lastChar != "b" || lastCount < 2)) {
                charToAppend = "b"
            } else if (countC > 0 && (lastChar != "c" || lastCount < 2)) {
                charToAppend = "c"
            } else {
                // 추가할 수 있는 문자가 없으면 종료
                break
            }

            // 선택한 문자 추가 및 상태 업데이트
            if let char = charToAppend {
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
            }
        }

        return result
    }
}