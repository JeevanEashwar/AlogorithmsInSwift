import Foundation

// Using intermediate array
func reverseLinkedListUsingArray(head: ListNode<Int>) -> ListNode<Int> {
    var input: [Int] = []
    var current: ListNode<Int>? = head
    while current != nil {
        input.append(current!.val)
        current = current?.next
    }
    var newHead: ListNode<Int> = ListNode(val: input.first!, next: nil)
    for i in 1 ..< input.count {
        let value = input[i]
        newHead = ListNode(val: value, next: newHead)
    }
    return newHead
}


// Using swapping technique
func reverseLinkedListUsingSwapping(head: ListNode<Int>) -> ListNode<Int> {
    var current: ListNode<Int>? = head
    var previous: ListNode<Int>? = nil
    while current != nil {
        // Swap current and previous
        let temp: ListNode<Int>? = current?.next
        // Perform swapping
        current?.next = previous
        previous = current
        current = temp
    }
    return previous!
}
