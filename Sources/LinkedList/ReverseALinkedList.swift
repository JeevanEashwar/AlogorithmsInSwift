import Foundation

public class ReverseALinkedList {
    public init() {}
    public func reverse(head: ListNode<Int>) -> ListNode<Int> {
        var current: ListNode<Int>? = head
        var previous: ListNode<Int>? = nil
        while current != nil {
            let temp: ListNode<Int>? = current?.next
            current?.next = previous
            previous = current
            current = temp
        }
        return previous!
    }
    
    public func reverse2(head: ListNode<Int>) -> ListNode<Int> {
        var input: [Int] = []
        var current: ListNode<Int>? = head
        while current != nil {
            input.append(current!.val)
            current = current?.next
        }
        var head: ListNode<Int> = ListNode(val: input.first!, next: nil)
        for i in 1 ..< input.count {
            let value = input[i]
            head = ListNode(val: value, next: head)
        }
        return head
    }
}
