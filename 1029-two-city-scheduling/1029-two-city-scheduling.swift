class Solution {
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        let sorted = costs.sorted {
            $0[0] - $0[1] < $1[0] - $1[1]
        }
        let enumerated = sorted.enumerated()
        let ret = enumerated.reduce(0) {
            if $1.0 < (costs.count / 2) {
                return $0 + $1.1[0]
            }
            return $0 + $1.1[1]
        }
        return ret
    }
}
