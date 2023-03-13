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
    var nodesCount = 0
    var head: ListNode?
    
    init(_ head: ListNode?) {
        self.head = head
        var curr = head
        while curr != nil {
            nodesCount += 1
            curr = curr?.next
        }
    }
    
    func getRandom() -> Int {
        let index = Int.random(in: 1 ... nodesCount)
        var count = 1
        var curr = head
        while true {
            if count == index {
                break  
            }
            count += 1
            curr = curr?.next
        }
        return curr?.val ?? -1
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(head)
 * let ret_1: Int = obj.getRandom()
 */