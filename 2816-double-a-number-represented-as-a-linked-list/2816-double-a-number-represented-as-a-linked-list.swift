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

class Solution {
    func doubleIt(_ head: ListNode?) -> ListNode? {
        var stack: [ListNode?] = []
        var node = head

        var oldNode: ListNode? = nil

        while true {
            stack.append(node)
            if node?.next == nil {
                break
            }
            node = node?.next
        }
        var upper = 0
        for i in (0..<stack.count).reversed() {
            let nd = stack[i]
            if let value = nd?.val {
                //print(value, upper)
                let newValue = value * 2 + upper
                let v = newValue % 10
                upper = newValue / 10

                let tempNode: ListNode? = ListNode(newValue % 10)

                tempNode?.next = oldNode
                oldNode = tempNode                
            }
        }
        if upper != 0 {
            let last = ListNode(upper, oldNode)
            oldNode = last
        }

        return oldNode
    }
}