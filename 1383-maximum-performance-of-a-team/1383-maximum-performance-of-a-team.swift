
private class Solution {
    struct Engineer {
        var speed: Int
        var efficiency: Int
    }
    
    
    struct Heap {
        private var pq : [Int] = []
        private var idx = 0
        
        var front: Int { return pq[1] }
        var size: Int { return idx }
        var isEmpty: Bool { return idx == 0 }
        init(_ count: Int) {
            pq = [Int](repeating: 0, count: count)
        }
        func compare(_ a: Int, _ b :Int) -> Bool {
            return pq[a] <= pq[b]
        }
        
        mutating func push(_ inp: Int) {
            var c = 0
            var p = 0
            idx += 1
            pq[idx] = inp
            c = idx; p = c / 2
            while p >= 0, !compare(p, c) {
                let temp = pq[c]; pq[c] = pq[p]; pq[p] = temp
                c = p; p = c / 2
            }
        }

        mutating func pop() {
            pq[1] = pq[idx]
            idx -= 1
            var p = 1; var l = 2; var r = 3; var c = 0
            while l <= idx {
                if r > idx {
                    c = l;
                }else { c = compare(l, r) ? l: r}
                if compare(p, c) {break}
                let temp = pq[p]; pq[p] = pq[c]; pq[c] = temp;
                p = c; l = p * 2; r = l + 1
            }
        }
    }
    
    func maxPerformance(_ n: Int, _ speed: [Int], _ efficiency: [Int], _ k: Int) -> Int {
        var eng: [Engineer] = []
        for i in 0..<n {
            eng.append(Engineer(speed: speed[i], efficiency: efficiency[i]))
        }
        
        eng.sort {
            $0.efficiency > $1.efficiency
        }

        var heap = Heap(n + 1)
        var sum = 0, result = 0
        for p in eng {
            let e = p.efficiency, s = p.speed
            sum += s
            heap.push(s)
            if heap.size > k {
                sum -= heap.front
                heap.pop()
            }
            result = max(result, sum * e)
        }
        return result % (1000000007)
    }
}
