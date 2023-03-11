/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
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
    var nodes: [Int] = []
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        if head == nil { return nil }
        var node = head
        while node != nil {
            if let value = node?.val {
                nodes.append(value)
            }
            node = node?.next
        }
        let m = nodes.count / 2
        var root: TreeNode? = TreeNode(nodes[nodes.count / 2], nil, nil)
        makeTreeNode(0, m, root)
        makeTreeNode(m + 1, nodes.count, root)
        return root
        //[1 2 3 4 5]  6  [7 8 9 10 11]
        //[1 2 3 4 5]
    }
    
    func makeTreeNode(_ s: Int, _ e: Int, _ parent: TreeNode?) {
        if s >= e { return }
        let m = ((s + e) / 2)
        let newNode: TreeNode? = TreeNode(nodes[m], nil, nil)
        if let p = parent?.val {
            if p < nodes[m] {
                parent?.right = newNode
            } else {
                parent?.left = newNode
            }
        }
        makeTreeNode(s, m, newNode)
        makeTreeNode(m + 1, e, newNode)
    }
}