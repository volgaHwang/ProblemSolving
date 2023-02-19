/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *	   public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func connect(_ root: Node?) -> Node? {
        var q: [Node?] = [root]
        var front = 0
        while true {
            if q.count == front { break }
            let start = front, end = q.count
            for i in start..<end {
                if i + 1 < end {
                    q[i]?.next = q[i + 1]
                } else {
                    q[i]?.next = nil
                }
                if q[i]?.left != nil {
                    q.append(q[i]?.left)
                }
                if q[i]?.right != nil {
                    q.append(q[i]?.right)  
                }
                front += 1
            }
        }
        return root
    }
}