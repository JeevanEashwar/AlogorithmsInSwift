import Foundation

public class Palindrome {
    public init() {}
    /// https://leetcode.com/problems/valid-palindrome/
    public func isPalindrome(input: String) -> Bool {
        // Convert all characters to either upper case or lower case
        let inputChars = Array(input.uppercased())
        // Two pointers to traverse. One from the left and the other from the right
        var left = 0
        var right = input.count - 1
        while left < right {
            // Skip non alhpa numeric characters while comparing left and right
            while !inputChars[left].isAlphanumeric && left < right {
                left += 1
            }
            while !inputChars[right].isAlphanumeric && left < right {
                right -= 1
            }
            // return false if atleast one mismatch found
            if inputChars[left] != inputChars[right] {
                return false
            } else {
                left += 1
                right -= 1
            }
        }
        return true
    }
}

extension Character {
  var isAlphanumeric : Bool {
    return isLetter || isNumber
  }
}
