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
    func smallestFromLeaf(_ root: TreeNode?) -> String {
        var smallestString = ""
        var nodeQueue = [(TreeNode, String)]()
        
        if let root = root {
            nodeQueue.append((root, String(UnicodeScalar(Character("a").asciiValue! + UInt8(root.val)))))
        }
        
        while !nodeQueue.isEmpty {
            let (node, currentString) = nodeQueue.removeFirst()
            
            if node.left == nil && node.right == nil {
                if smallestString.isEmpty {
                    smallestString = currentString
                } else {
                    smallestString = min(smallestString, currentString)
                }
            }
            
            if let leftChild = node.left {
                let leftChar = String(UnicodeScalar(Character("a").asciiValue! + UInt8(leftChild.val)))
                nodeQueue.append((leftChild, leftChar + currentString))
            }
            
            if let rightChild = node.right {
                let rightChar = String(UnicodeScalar(Character("a").asciiValue! + UInt8(rightChild.val)))
                nodeQueue.append((rightChild, rightChar + currentString))
            }
        }
        
        return smallestString
    }
}