import Foundation


struct Stack<T> {
    private var items: [T] = []
    
    
    // Push
    mutating func push(_ element: T) {
        items.append(element)
    }
    
    // Pop
    @discardableResult
    mutating func pop() -> T? {
        return items.removeLast()
    }
    
    // Peek
    func peek() -> T? {
        guard let topElement = items.last else { return nil }
        return topElement
    }
    
    // isEmpty
    func isEmpty() -> Bool {
        items.isEmpty
    }
}


extension Stack: CustomStringConvertible {
    var description: String {
        // top divider
        // elements
        // bottom divider
        let topDivider = "----Top----"
        let bottomDivider = "----Bottom----"
        var stackElements = ""
        items.forEach { element in
            stackElements.append("\(element)\n")
        }
        return topDivider + stackElements + bottomDivider
    }
}





