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
    func tree2str(_ root: TreeNode?) -> String {
        if root == nil { return "" }
        var str = "\(root?.val ?? 0)"
        if root?.left != nil || root?.right != nil  {
            str += "(" + tree2str(root?.left) + ")"
        }
        if root?.right != nil {
            str += "(" + tree2str(root?.right) + ")"
        }
        return str
    }
}
