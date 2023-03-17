final class TrieNode {
    var isLast: Bool = false
    var dict: [Character: TrieNode] = [:]
    init(_ isLast: Bool = false, _ dict: [Character: TrieNode] = [:]) {
        self.isLast = isLast
        self.dict = dict
    }
}

final class Trie {
    private let root: TrieNode

    init() {
        root = TrieNode()
    }
    
    func insert(_ word: String) {
        var node = root

        for c in word {
            if let childNode = node.dict[c] {
                node = childNode
            } else {
                let newNode = TrieNode()
                node.dict[c] = newNode
                node = newNode
            }
        }

        node.isLast = true
    }
    
    func search(_ word: String) -> Bool {
        var node = root

        for c in word {
            guard let child = node.dict[c] else {
                return false
            }
            node = child
        }

        return node.isLast
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var node = root

        for c in prefix {
            guard let child = node.dict[c] else {
                return false
            }
            node = child
        }
        return true
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */