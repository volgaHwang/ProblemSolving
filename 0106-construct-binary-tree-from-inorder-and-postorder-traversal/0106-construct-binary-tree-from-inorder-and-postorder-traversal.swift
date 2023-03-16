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
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        return helper(0, inorder.count - 1, 0, postorder.count - 1, inorder, postorder)
    }
    
    func helper(_ inStart: Int, _ inEnd: Int, _ postStart: Int, _ postEnd: Int, _ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        if postStart > postEnd {
            return nil
        }
        
        let root = TreeNode(postorder[postEnd])
        var inIndex = 0
        
        for i in inStart...inEnd {
            if inorder[i] == root.val {
                inIndex = i
                break
            }
        }
        root.left = helper(inStart, inIndex - 1, postStart, postStart + inIndex - inStart - 1, inorder, postorder)
        root.right = helper(inIndex + 1, inEnd, postEnd - inEnd + inIndex, postEnd - 1, inorder, postorder)
        
        return root
    }
}