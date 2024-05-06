class Solution {
    func removeNodes(_ head: ListNode?) -> ListNode? {
        var stack: [ListNode] = []
        var current = head
        
        // Add nodes to the stack
        while let node = current {
            stack.append(node)
            current = node.next
        }
        
        guard let lastNode = stack.popLast() else {
            return nil
        }
        
        var maximum = lastNode.val
        var resultList: ListNode? = ListNode(maximum)
        
        // Remove nodes from the stack and add to result
        while !stack.isEmpty {
            let currentNode = stack.popLast()!
            
            // Current should not be added to the result
            if currentNode.val < maximum {
                continue
            }
            // Add new node with current's value to front of the result
            else {
                let newNode = ListNode(currentNode.val)
                newNode.next = resultList
                resultList = newNode
                maximum = currentNode.val
            }
        }
        
        return resultList
    }
}