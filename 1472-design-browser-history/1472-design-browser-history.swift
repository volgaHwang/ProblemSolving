
class BrowserHistory {
    final class Node {
        var url: String
        var front: Node?, rear: Node?
        init(_ url: String, _ front: Node?, _ rear: Node?) {
            self.url = url
            self.front = front
            self.rear = rear
        }
        init(_ url: String) {
            self.url = url
            self.front = nil
            self.rear = nil
        }
        func pop() -> String {
            front?.rear = rear
            rear?.front = front
            return url
        }
    }
    var head = Node("")
    var tail = Node("")
    var urlStack: [String]
    var nowUrl: Int

    init(_ homepage: String) {
        head.rear = tail
        tail.front = head
        urlStack = [homepage]
        nowUrl = 0
    }
    
    func visit(_ url: String) {
        head.rear = tail
        tail.front = head

        urlStack.append(url)
        nowUrl += 1
    }
    
    func back(_ steps: Int) -> String {
        var steps = steps
        while steps > 0 {
            if urlStack.count > 1, let url = urlStack.popLast() {
                nowUrl -= 1
                let node: Node? = Node(url, tail.front, tail)
                tail.front?.rear = node
                tail.front = node
            }
            steps -= 1
        }
        return urlStack.last ?? ""
    }
    
    func forward(_ steps: Int) -> String {
        var steps = steps
        while steps > 0 {
            if tail.front !== head, let url = tail.front?.pop() {
                urlStack.append(url)
                nowUrl += 1
            }
            steps -= 1
        }
        return urlStack.last ?? ""
    }
}

/**
 * Your BrowserHistory object will be instantiated and called as such:
 * let obj = BrowserHistory(homepage)
 * obj.visit(url)
 * let ret_2: String = obj.back(steps)
 * let ret_3: String = obj.forward(steps)
leetcode, google, facebook, linkedin
 */