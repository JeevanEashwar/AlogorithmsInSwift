import Foundation

func mergeTwoSortedLists(_ list1: ListNode<Int>?, _ list2: ListNode<Int>?) -> ListNode<Int>? {
    var l1: ListNode<Int>? = list1
    var l2: ListNode<Int>? = list2
    let head: ListNode<Int>? = ListNode(val: -1, next: nil)
    var tail = head
    while (l1 != nil && l2 != nil) {
        if l1!.val < l2!.val {
            tail?.next = l1
            l1 = l1!.next
        } else {
            tail?.next = l2
            l2 = l2!.next
        }
        tail = tail?.next
        
    }
    if l1 != nil {
        tail?.next = l1
    }
    if l2 != nil {
        tail?.next = l2
    }
    return head?.next
    
}

