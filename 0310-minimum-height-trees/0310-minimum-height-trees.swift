class Solution {
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        if n == 1 {
            return [0]
        }
        
        var graph: [Int: [Int]] = [:]
        for edge in edges {
            let u = edge[0]
            let v = edge[1]
            graph[u, default: []].append(v)
            graph[v, default: []].append(u)
        }
        
        var leaves: [Int] = []
        for (node, neighbors) in graph {
            if neighbors.count == 1 {
                leaves.append(node)
            }
        }
        
        var remainingNodes = n
        while remainingNodes > 2 {
            remainingNodes -= leaves.count
            
            var newLeaves: [Int] = []
            for leaf in leaves {
                let neighbor = graph[leaf]!.first!
                graph[neighbor]!.removeAll(where: { $0 == leaf })
                
                if graph[neighbor]!.count == 1 {
                    newLeaves.append(neighbor)
                }
                
                graph[leaf] = nil
            }
            
            leaves = newLeaves
        }
        
        return leaves
    }
}