import Foundation

public class MinimumWindowSubString {
    public init() {}
    /// https://leetcode.com/problems/minimum-window-substring/submissions/
    public func minWindow(_ s: String, _ t: String) -> String {
        /// 
        /// Edge cases - return empty string for invalid cases
        if (t.count == 0) || (t.count > s.count) {
            return ""
        }
        let tAsArray: [Character] = Array(t)
        let sAsArray: [Character] = Array(s)
        var windowFreq: [Character: Int] = [:] // hash map to store the occurance of each character in the current window
        var tFreq: [Character: Int] = [:] // hash map to store the occurance of each character in input 't' string
        var resultLength: Int = Int.max // We need shortest window, so start from maximum possible
        var resultIndices: (Int, Int) = (-1, -1) // Default (give some invalid indices)
        // (A) - Calculate the frequencies of occurances for every character of input string 't'
        for char in tAsArray {
            tFreq[char] = 1 + (tFreq[char] ?? 0)
        }
        // If 't' = "ABC", We are interested in the characters 'A', 'B' & 'C'. We need to check the frequencies of 'A', 'B' & 'C' in the currentWindow to be matches. So, the needCount is '3'
        let needCount: Int = tFreq.values.count // We need only the unique character count of frequencies to be matched
        var haveCount: Int = 0
        var leftIndex: Int = 0
        var rightIndex: Int = 0
        
        // (B) - To maintain a current window, we need two indices.(leftIndex & rightIndex)
        // (C) - Add one character at a time to the current window
        //     - Update its frequency in the currentWindowFreq hash map
        //     - Check if we have enough count of this character occurances in the windowFreq hashmap. PS: We are interested only in the characters of input 't' string
        for rightIndex in 0 ..< sAsArray.count {
            let charOnRight: Character = sAsArray[rightIndex]
            windowFreq[charOnRight] = 1 + (windowFreq[charOnRight] ?? 0)
            // (D)  - Logic here is to update the `haveCount` only when `windowFreq[charOnRight]` is exactly equal to `tFreq[charOnRight]`.
            //      - We will ignore if `windowFreq[charOnRight]` is more than `tFreq[charOnRight]`. This is because it was already updated in the `haveCount` when they were exactly equal.
            if tFreq.keys.contains(charOnRight) && windowFreq[charOnRight] == tFreq[charOnRight] {
                haveCount += 1
            }
            while (needCount == haveCount) {
                // Update the result once found.
                let currentLength: Int = rightIndex - leftIndex + 1
                if currentLength < resultLength {
                    resultLength = currentLength
                    resultIndices = (leftIndex, rightIndex)
                }
                // If we have the frequencies of characters that are needed, our next target is to keep the window to minimum length possible. To achieve this start cutting the window from the left as long the window is valid
                let charOnLeft: Character = sAsArray[leftIndex]
                windowFreq[charOnLeft] = (windowFreq[charOnLeft] ?? 0) - 1
                if tFreq.keys.contains(charOnLeft) && (windowFreq[charOnLeft] ?? 0) < (tFreq[charOnLeft] ?? 0) {
                    haveCount -= 1
                }
                leftIndex += 1
            }
        }
        (leftIndex, rightIndex) = resultIndices
        // If we found any valid window, the resultLength would have changed from `Int.max` to something else.
        // We need to form substring to return it as the result.
        // To get a range, leftIndex should be less rightIndex
        // If both leftIndex and rightIndex are equal, it means the result is a single character
        // If none of the above cases happened, return empty string
        if resultLength != Int.max && leftIndex < rightIndex {
            let start = s.index(s.startIndex, offsetBy: leftIndex)
            let end = s.index(s.startIndex, offsetBy: rightIndex)
            let range = start..<end
            let result = String(s[range])
            return result
        } else if leftIndex >= 0 && leftIndex < sAsArray.count && leftIndex == rightIndex {
            return String(sAsArray[leftIndex])
        } else {
            return ""
        }
    }
    
    /// Handy function to check if parent has all characters of child irrespective of the order of occurance.
    func containsSubstringIgnoreOrder(parent: String, subStr: String) -> Bool {
        if subStr.count > parent.count {
            return false
        }
        let s1Array: [Character] = Array(subStr)
        let s2Array: [Character] = Array(parent)
        var s1FreqDict: [Character: Int] = [:]
        var s2FreqDict: [Character: Int] = [:]
        for char in s1Array {
            s1FreqDict[char] = 1 + (s1FreqDict[char] ?? 0)
        }
        for char in s2Array {
            s2FreqDict[char] = 1 + (s2FreqDict[char] ?? 0)
        }
        for (key, value) in s1FreqDict {
            if value > (s2FreqDict[key] ?? 0) {
                return false
            }
        }
        return true
    }
}
