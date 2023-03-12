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
    func merge(_ left: ListNode?, _ right: ListNode?) -> ListNode? {
        let root: ListNode? = ListNode()
        var node = root, left = left, right = right
        
        while left != nil, right != nil {
            guard let v = left?.val, let u = right?.val else {
                return nil
            }
            let newNode: ListNode? = u < v ? ListNode(u) : ListNode(v)
            node?.next = newNode
            node = node?.next
            if u < v { 
                right = right?.next
            } else {
                left = left?.next
            }
        }
        if left != nil {
            while left != nil {
                guard let v = left?.val else {
                    return nil
                }
                let newNode: ListNode? = ListNode(v)
                node?.next = newNode
                node = node?.next
                left = left?.next
            }
        }
        if right != nil {
            while right != nil {
                guard let v = right?.val else { return nil }
                let newNode: ListNode? = ListNode(v)
                node?.next = newNode
                node = node?.next
                right = right?.next
            }
        }
        return root?.next
    }

    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var lists = lists.filter { $0 != nil }, k = lists.count
        if lists.count == 0 { return nil }
        if lists.count == 1 { return lists[0] }

        var changeable: [ListNode?] = lists
        
        while changeable.count != 1 {
            var index = 0
            var nextAble: [ListNode?] = []
            while index < changeable.count {
                let now = index, next = index + 1
                let newN = next < changeable.count ? merge(changeable[now], changeable[next]) : changeable[now]
                nextAble.append(newN)
                index += 2
            }
            changeable = nextAble
        }

        return changeable[0]
    }
}