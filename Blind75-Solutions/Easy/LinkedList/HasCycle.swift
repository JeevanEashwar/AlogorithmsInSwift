import Foundation

// Using visitor book / array
func hasCycle(_ head: ListNode<Int>?) -> Bool {
    var visitorBook: [ListNode<Int>] = []
    var pointer: ListNode<Int>? = head
    var cycleFound: Bool = false
    while (pointer != nil && !cycleFound) {
        cycleFound = visitorBook.contains { visitorNode in
            pointer === visitorNode
        }
        visitorBook.append(pointer!)
        pointer = pointer?.next
    }
    return cycleFound
}


// Using Floyd's tortoise and hare technique

func hasCycleUsingFloydsTechnique(_ head: ListNode<Int>?) -> Bool {
    var slow: ListNode<Int>? = head
    var fast: ListNode<Int>? = head
    while (fast != nil && fast?.next != nil) {
        slow = slow?.next
        fast = fast?.next?.next
        if fast === slow {
            return true
        }
    }
    return false
}
























