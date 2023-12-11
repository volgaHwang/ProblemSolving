class Solution {
    func findSpecialInteger(_ arr: [Int]) -> Int {
        let numberOfArr = arr.count / 4
        var counter = 0
        var comparator = -1
        
        for number in arr {
            if number != comparator {
                comparator = number
                counter = 0
            }
            counter += 1
            if counter > numberOfArr {
                return comparator
            }
        }
        return -1
    }
}
