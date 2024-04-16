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
    var targetDepth = 0
    func addOneRow(_ root: TreeNode?, _ val: Int, _ depth: Int) -> TreeNode? {
        self.targetDepth = depth
        if depth == 1 {
            let node = root
            let newNode = TreeNode(val, node, nil)
            return newNode
        }
        searchTree(root, val, 1)
        return root
    }

    func searchTree(_ node: TreeNode?, _ val: Int, _ nowDepth: Int) {
        if node == nil {
            return
        }
        if nowDepth + 1 == targetDepth {
            let left = node?.left
            let right = node?.right
            let newLNode = TreeNode(val, left, nil)
            let newRNode = TreeNode(val, nil, right)
            node?.left = newLNode
            node?.right = newRNode
        }
        searchTree(node?.left, val, nowDepth + 1)
        searchTree(node?.right, val, nowDepth + 1)
    }
}