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
        guard let value = root?.val else {
            return ""
        }
        var answer = "\(value)"
        var left = ""
        var right = ""
        if nil != root?.left {
            left = "(" + tree2str(root?.left) + ")"
        }
        if nil != root?.right {
            right = "(" + tree2str(root?.right) + ")"
        }
        if left == "", right != "" {
            answer += "()" + right
        } else {
            answer += left + right
        }
        return answer
    }
}