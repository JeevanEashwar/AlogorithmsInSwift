import Foundation


func validParantheses(_ s: String) -> Bool {
    // Dictionary to store open close parantheses combinations
    let openClose: [Character: Character] = [
        ")": "(",
        "]": "[",
        "}": "{"
    ]
    // Stack
    var stack: Stack<Character> = Stack()
    
    for char in s {
        if openClose.keys.contains(char) {
            // If the stack is empty
            if stack.isEmpty() {
                //Input cannot start with closing parantheses
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
