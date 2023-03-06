class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let root: ListNode? = ListNode(0)
        var node = root, l1 = l1, l2 = l2
        var carry = 0
        while l1 != nil || l2 != nil || carry != 0 {
            var v = (l1 != nil ? (l1?.val)! : 0) + (l2 != nil ? (l2?.val)! : 0) + carry
            if v >= 10 {
                v -= 10
                carry = 1
            } else { carry = 0 }
            let newNode = ListNode(v)
            node?.next = newNode
            node = newNode
            if l1 != nil {
                l1 = l1?.next
            }
            if l2 != nil {
                l2 = l2?.next
            }
        }
        return root?.next
    }
}