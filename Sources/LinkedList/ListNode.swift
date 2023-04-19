import Foundation

public class ListNode<T> {
    public init(val: T, next: ListNode<T>?) {
        self.val = val
        self.next = next
    }
    public var val: T
    public var next: ListNode<T>?
}
extension ListNode: CustomStringConvertible {
    public var description: String {
        if let next = next {
            return "\(val) -> \(next.description)"
        } else {
            return "\(val)"
        }
    }
}
//struct LinkedList<T> {
//    var head: ListNode<T>?
//    var tail: ListNode<T>?
//
//    mutating func push(value: T) {
//        head = ListNode(val: value, next: head)
//        if tail == nil {
//            tail = head
//        }
//    }
//
//    mutating func append(_ value: T) {
//        if head == nil {
//            push(value: value)
//            return
//        }
//        let node = ListNode(val: value, next: nil)
//        tail?.next = node
//        tail = node
//    }
//
//    func node(at index: Int) -> ListNode<T>? {
//        var currentNode = head
//        var currentIndex = 0
//        while currentNode != nil && currentIndex < index {
//            currentIndex += 1
//            currentNode = currentNode?.next
//        }
//        if index == currentIndex {
//            return currentNode
//        }
//        return nil
//    }
//
//    func insert(value: T, after node: ListNode<T>) {
//        node.next = ListNode(val: value, next: node.next)
//    }
//
//    func isEmpty() -> Bool {
//        return head == nil
//    }
//
//    mutating func pop() -> T? {
//        defer {
//            head = head?.next
//            if isEmpty() {
//                tail = nil
//            }
//        }
//        return head?.val
//    }
//
//    mutating func removeLast() -> T? {
//        guard let head = head else {
//            return nil
//        }
//        var current = head
//        var prev = head
//        while let next = current.next {
//            prev = current
//            current = next
//        }
//        prev.next = nil
//        tail = prev
//        return current.val
//    }
//
//    mutating func remove(after node: ListNode<T>) -> T? {
//
//        defer {
//            if node.next === tail {
//                tail = node
//            }
//
//            node.next = node.next?.next
//        }
//
//        return node.next?.val
//
//    }
//}
//
//extension LinkedList: CustomStringConvertible {
//    var description: String {
//        guard let head = head else {
//            return "Empty List"
//        }
//        return head.description
//    }
//}
