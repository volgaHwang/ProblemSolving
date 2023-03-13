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
    var isOK = true
    func recur(left: TreeNode?, right: TreeNode?) {
        guard let u = left?.val, let v = right?.val, u == v else {
            isOK = false
            return
        }
        if left?.left != nil, right?.right != nil {
            recur(left: left?.left, right: right?.right)
        } else if left?.left != nil, right?.right == nil {
            isOK = false
            return
        } else if left?.left == nil, right?.right != nil {
            isOK = false
            return
        }
        
        if left?.right != nil, right?.left != nil {
            recur(left: left?.right, right: right?.left)
        } else if left?.right != nil, right?.left == nil {
            isOK = false
            return
        } else if left?.right == nil, right?.left != nil {
            isOK = false
            return
        }
    }

    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root == nil { return isOK }
        if root?.left == nil, root?.right == nil { return isOK }
        recur(left: root?.left, right: root?.right)

        return isOK
    }
}

/*
[9,-42,-42,null,76,76,null,null,13,null,13]

  -42

9 

  -42
*/