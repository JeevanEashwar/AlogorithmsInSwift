import Foundation
public class ValidParantheses {
    public init() {}
    public func isValid(_ s: String) -> Bool {
        let openClose: [Character: Character] = [")": "(",
                                                 "]" : "[",
                                                 "}" : "{"
                                                ]
        var stack: Stack<Character> = Stack()
        for char in s {
            if openClose.keys.contains(char) {
                if stack.isEmpty() {
                    // Input cannot start with the closing parantheses
                    return false
                } else {
                    if let topCharInStack = stack.peek(), topCharInStack == openClose[char] {
                        stack.pop()
                    }
                }
            } else {
                stack.push(char)
            }
        }
        return stack.isEmpty()
    }
}
