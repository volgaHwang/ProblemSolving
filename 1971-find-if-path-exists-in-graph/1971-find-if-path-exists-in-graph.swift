class Solution {
    var map: [Int: [Int]] = [:]
    func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        if destination == source {
            return true
        }
        var visit: [Bool] = [Bool](repeating: false, count: (2 * 100000) + 1)
        for edge in edges {
            let left = edge[0], right = edge[1]
            map[left, default: []].append(right)
            map[right, default: []].append(left)
        }
        var q: [Int] = [source]
        visit[source] = true
        var front = 0

        while q.count > front {
            let now = q[front]
            front += 1

            for next in map[now, default: []] {
                if visit[next] {
                    continue
                }
                if next == destination {
                    return true
                }
                visit[next] = true
                q.append(next)
            }
        }
        return false
    }
}