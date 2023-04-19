import Foundation
public class ListHasCycle {
    public init() {}
    public func hasCycle(_ head: ListNode<Int>?) -> Bool {
        var visitorBook: [ListNode<Int>] = []
        var pointer: ListNode<Int>? = head
        var cycleFound: Bool = false
        while pointer != nil && !cycleFound {
            cycleFound = visitorBook.contains { visitorNode in
                pointer === visitorNode
            }
            visitorBook.append(pointer!)
            pointer = pointer?.next
        }
        return cycleFound
    }
    public func hasCycleWithFloydsTortoiseAndHareAlgo(_ head: ListNode<Int>?) -> Bool {
        var slow: ListNode? = head
        var fast: ListNode? = head
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                return true
            }
        }
        return false
    }
}
