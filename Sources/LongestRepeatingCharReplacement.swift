// https://leetcode.com/problems/longest-substring-without-repeating-characters/
import Foundation
public class LongestCharReplacement {
    public init() {}
    public func longestRepeatingCharacterReplacement(_ inputString: String, _ maxReplacements: Int) -> Int {
        let input: [Character] = Array(inputString) // String to [Character] so that subscripting is easy
        var leftIndex: Int = 0
        var freqDict: [Character: Int] = [:] // To store the number times a character occurred in the current window
        var result: Int = 0
        for rightIndex in 0 ..< input.count {
            // Increment the count of number of times the character at rightIndex occurred in the current window
            freqDict[input[rightIndex]] = 1 + (freqDict[input[rightIndex]] ?? 0)
            // (A) (rightIndex - leftIndex + 1) is the length of the window
            // (B) freqDict.values.max will give the count of maximum repeated character
            // To keep the number of replacements to minimum we will have replace the characters other than the most frequently occurred character.
            // (C) = (A) - (B) will give the count of characters to be replaced so that we make the window with repeating characters.
            // If (C) exceeds input parameter `maxReplacements`, window is invalid and cut the left end of the window by one index. Also, remove the character at left index from the freqDict as it is no longer part of the window
            while((rightIndex - leftIndex + 1) - (freqDict.values.max() ?? 0) > maxReplacements) {
                freqDict[input[leftIndex]] = (freqDict[input[leftIndex]] ?? 0) - 1
                leftIndex += 1
            }
            result = max(result, (rightIndex - leftIndex + 1)) // Window length = rightIndex - leftIndex + 1
        }
        return result
    }
}



