class Solution {
    private func dfs(_ node: Int, _ graph: inout [[Int]], _ visited: inout Set<Int>) -> Bool {
        
        guard !visited.contains(node) else {
            return false
        }
        
        visited.insert(node)
        let neighbors = graph[node]
        
        guard neighbors.count > 0 else {
            visited.remove(node)
            return true
        }
        
        for neighbor in neighbors {
            if !dfs(neighbor, &graph, &visited) {
                return false
            }
        }
        
        visited.remove(node)
        graph[node] = []
        return true
    }

    func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
        var graph = graph
        var result = [Int]()
        
        for i in 0..<graph.count {
            var visited = Set<Int>()
            if dfs(i, &graph, &visited) {
                result.append(i)
            }
        }
        
        return result
    }
}
