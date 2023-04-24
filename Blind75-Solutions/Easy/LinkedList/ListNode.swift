import Foundation

class ListNode<T> {
    var val: T
    var next: ListNode<T>?
    init(val: T, next: ListNode<T>?) {
        self.val = val
        self.next = next
    }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        // 5->4->3->2->1
        if let next = next {
            return "\(val) -> \(next.description)"
        } else {
            return "\(val)"
        }
    }
}
