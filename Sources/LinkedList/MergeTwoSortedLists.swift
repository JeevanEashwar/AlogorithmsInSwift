import Foundation
public class MergeTwoSortedLists {
    public init() {}
    public func mergeTwoSortedLists(_ list1: ListNode<Int>?, _ list2: ListNode<Int>?) -> ListNode<Int>? {
        let result: ListNode<Int> = ListNode(val: -1, next: nil)
        var currentHead: ListNode<Int>? = result
        var l1: ListNode<Int>? = list1
        var l2: ListNode<Int>? = list2
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                currentHead?.next = l1
                l1 = l1!.next
            } else {
                currentHead?.next = l2
                l2 = l2!.next
            }
            currentHead = currentHead?.next
        }
        if l1 != nil {
            currentHead?.next = l1
        }
        if l2 != nil {
            currentHead?.next = l2
        }
        return result.next
    }
}
