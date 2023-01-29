
import Foundation

class Solution {
    class Trie {
        var ch: [Character: Trie] = [:]
        var words: [String] = []
    }
    
    let root = Trie()
    
    var product: [String] = []
    
    func fillTrie() {
        for p in product {
            var current = root
            for c in p {
                if current.ch[c] == nil {
                    current.ch[c] = Trie()
                }
                current = current.ch[c, default: Trie()]
                current.words.append(p)
            }
        }
    }
    
    func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
        var answer = [[String]]()
        product = products.sorted { $0 < $1 }
        fillTrie()
        
        var current = root
        let arr = Array(searchWord)
        for i in 0..<arr.count {
            let c = arr[i]
            if current.ch[c] == nil {
                for _ in i..<searchWord.count {
                    answer.append([])
                }
                return answer
            } else {
                current = current.ch[c, default: Trie()]
                if current.words.count > 3 {
                    answer.append(Array(current.words[0..<3]))
                } else {
                    answer.append(current.words)
                }
            }
        }
        
        return answer
    }
}
