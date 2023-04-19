import Foundation

public struct Stack<T> {
    private var items: [T] = []
    
    public func peek() -> T? {
        guard let topElement = items.last else { return nil }
        return topElement
    }
    
    @discardableResult
    public mutating func pop() -> T {
        return items.removeLast()
    }
  
    public mutating func push(_ element: T) {
        items.append(element)
    }
    
    public func isEmpty() -> Bool {
        return items.isEmpty
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        let topDivider = "---Top---\n"
        let bottomDivider = "\n-----Bottom------\n"
        var stackElements: String = ""
        items.forEach({stackElements.append("\($0)\n")})
        return topDivider + stackElements + bottomDivider
    }
}
