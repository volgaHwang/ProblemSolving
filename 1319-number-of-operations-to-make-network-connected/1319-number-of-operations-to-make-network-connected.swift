class Solution {
    var parent: [Int] = []
    var edgeCount: [Int: Int] = [:]
    var nodeCount: [Int: Int] = [:]
    func getParent(_ a: Int) -> Int {
        if a == parent[a] { return a }
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

    func makeConnected(_ n: Int, _ connections: [[Int]]) -> Int {
        if n - 1 > connections.count { return -1 }
        let needMinimum = n - 1
        for i in 0...n {
            parent.append(i)
        }
        for connection in connections {
            unionParent(connection[0], connection[1])
        }

        for connection in connections {
            let a = getParent(connection[0])
            edgeCount[a, default: 0] += 1
        }

        for i in 0..<n {
            let a = getParent(i)
            nodeCount[a, default: 0] += 1
        }
        var sum = 0
        for (key, value) in edgeCount {
            let remain = value - (nodeCount[key, default: 0] - 1)
            sum += remain
        }
        var island = 0
        for i in 0..<n {
            if parent[i] == i { island += 1 }
        }
        if island - 1 > sum { return -1 }
        return island - 1
    }
}