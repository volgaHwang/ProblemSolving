/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        var q: [(node: TreeNode?, posi: Int)] = [(node: root, posi: 1)]
        var front = 0
        var count = 0
        while front != q.count {
            let now = q[front]
            let posi = now.posi
            front += 1
            if count + 1 != posi { return false }
            count += 1
            if now.node?.left != nil {
                q.append((node: now.node?.left, posi * 2))
            }
            if now.node?.right != nil {
                q.append((node: now.node?.right, posi * 2 + 1))
            }
        }
        return true
    }
}