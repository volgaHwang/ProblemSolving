class Solution {
    var parent: [Int] = []

    func getParent(_ a: Int) -> Int {
        if a == parent[a] {
            return a
        }
        parent[a] = getParent(parent[a])
        return parent[a]
    }

    func unionParent(_ a: Int, _ b: Int) {
        let a = getParent(a)
        let b = getParent(b)
        if a != b {
            if a < b { parent[b] = a }
            else { parent[a] = b }
        }
    }

    func minScore(_ n: Int, _ roads: [[Int]]) -> Int {
        var answer = 987654321
        for i in 0...n {
            parent.append(i)
        }
        let roads = roads.sorted { $0[2] < $1[2] }

        for road in roads {
            unionParent(road[0], road[1])
        }

        for road in roads {
            if getParent(road[0]) == 1 {
                answer = min(answer, road[2])
            }
        }

        return answer
    }
}