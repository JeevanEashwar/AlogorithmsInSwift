import Foundation

public class TwoPointers {
    public init() {}
    /// https://leetcode.com/problems/valid-palindrome/
    public func palindrome(input: String) -> Bool {
        let alphaNumericInput: String = input.alphanumeric
        var leftIndex: Int = 0
        var rightIndex: Int = alphaNumericInput.count - 1
        while (leftIndex < rightIndex) {
            if alphaNumericInput[leftIndex] != alphaNumericInput[rightIndex] {
                return false
            }
            leftIndex += 1
            rightIndex += 1
        }
        return true
    }
}

extension String {
    var alphanumeric: String {
        return self.components(separatedBy: CharacterSet.alphanumerics.inverted).joined().lowercased()
    }
    var length: Int {
        return count
    }
    
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
