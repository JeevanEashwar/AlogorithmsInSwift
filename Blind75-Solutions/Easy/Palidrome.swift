import Foundation


// Approach 1 - using single pointer
func isPalindromeUsingSinglePointer(input: String) -> Bool {
    let reversedInput = Array(input.uppercased().reversed())
    for (index, character) in input.uppercased().enumerated() {
        if character != reversedInput[index] {
            return false
        }
    }
    return true
}

extension Character {
    var isAlphaNumeric: Bool {
        return isLetter || isNumber
    }
}


// Approach 2 - using two pointers
func isPalindromeUsingTwoPointers(input: String) -> Bool {
    let inputCharacters = Array(input.uppercased())
    
    // Two pointers to traverse. One from the left and the other from the right
    var left = 0
    var right = input.count - 1
    
    while left < right {
        while !inputCharacters[left].isAlphaNumeric && left < right {
            left += 1
        }
        while !inputCharacters[right].isAlphaNumeric && left < right {
            right -= 1
        }
        
        if inputCharacters[left] != inputCharacters[right] {
            return false
        } else {
            left += 1
            right -= 1
        }
    }
    
    return true
}






