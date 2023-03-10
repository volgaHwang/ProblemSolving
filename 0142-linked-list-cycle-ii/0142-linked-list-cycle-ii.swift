/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */


class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var l = head, r = head
        while r != nil, r?.next != nil {
            l = l?.next
            r = r?.next?.next
            if l === r {
                l = head
                while l !== r {
                    l = l?.next
                    r = r?.next
                }
                return l
            }
        }
        return nil
    }
}