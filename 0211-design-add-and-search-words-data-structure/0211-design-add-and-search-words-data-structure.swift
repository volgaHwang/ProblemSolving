import Foundation

final class Node {
    var isEnd: Bool
    var alpha: [Character: Node]
    init(_ isEnd: Bool, _ alpha: [Character: Node]) {
        self.isEnd = isEnd
        self.alpha = alpha
    }
}

final class WordDictionary {
    var root: Node
    var isC: [Character]
    var isExist: Bool
    init() {
        root = Node(false, [:])
        isC = []
        isExist = false
    }
    
    func addWord(_ word: String) {
        var node = root
        for c in word {
            if let next = node.alpha[c] {
                node = next
            } else {
                let next = Node(false, [:])
                node.alpha[c] = next
                node = next                
            }
        }
        node.isEnd = true
    }

    func isSearch(_ idx: Int, _ node: Node) {
        // bad
        // 012
        if idx == isC.count {
            if node.isEnd == true { self.isExist = true }
            return
        }
        //print(idx, node.alpha, node.isEnd)
        if isC[idx] == "." {
            for (key, value) in node.alpha {
                isSearch(idx + 1, value)
            }
        } else {
            if let next = node.alpha[isC[idx]] {
                isSearch(idx + 1, next)
            }
        }
    }
    
    func search(_ word: String) -> Bool {
        isC = Array(word)
        isExist = false
        if isC[0] == "." {
            for (key, value) in root.alpha {
                isSearch(1, value)
            }
        } else {
            if let node = root.alpha[isC[0]] {
                isSearch(1, node)
            }
        }

        return isExist
    }
}

/**
 * Your WordDictionary object will be instantiated and called as such:
 * let obj = WordDictionary()
 * obj.addWord(word)
 * let ret_2: Bool = obj.search(word)
 */