import Foundation
public class PermutaionsInString {
    public init() {}
    /// https://leetcode.com/problems/permutation-in-string/
    public func permutationInString(_ s1: String, _ s2: String) -> Bool {
        // A string is said to be a permutation of another string if the frequencies of all their characters match
        // Since given input will only have lower case a - z, the matches should be 26
        if s1.count > s2.count {
            return false
        }
        var matches: Int = 0
        let s1Array: [Character] = Array(s1)
        let s2Array: [Character] = Array(s2)
        // (A) - Initialize hash maps for each input string
        var s1FreqDict: [Int: Int] = [:]
        var s2FreqDict: [Int: Int] = [:]
        for asciiValue in 97...122 { // 'a' to 'z' ascii stride
            s1FreqDict[asciiValue] = 0
            s2FreqDict[asciiValue] = 0
        }
        
        // (B) - Count the frequency of first 's1.count' elements. s1 will be iterated completely, but s2 will have left over characters
        for index in 0 ..< s1Array.count {
            s1FreqDict[Int(s1Array[index].asciiValue!)]! += 1
            s2FreqDict[Int(s2Array[index].asciiValue!)]! += 1
        }
        
        // (C) - Check for initial matches
        for asciiValue in 97...122 {
            if s1FreqDict[asciiValue] == s2FreqDict[asciiValue] {
                matches += 1
            }
        }
        
        // (D) - Count the frequency of remaining characters in s2.
        // keep the window length to s1 length - to do this,
        // - maintain left and right indices,
        // - keep adding in rightIndex and keep cutting the left index
        var leftIndex: Int = 0, rightIndex: Int = s1.count
        while (rightIndex < s2.count) {
            if matches == 26 {
                return true
            }
            // Adding on the right end
            let asciiValueRight = Int(s2Array[rightIndex].asciiValue!)
            s2FreqDict[asciiValueRight]! += 1
            if s1FreqDict[asciiValueRight] == s2FreqDict[asciiValueRight] {
                matches += 1
            } else if s1FreqDict[asciiValueRight]! + 1 == s2FreqDict[asciiValueRight] {
                matches -= 1
            }
            rightIndex += 1
            
            // Cuting from the left end
            let asciiValueLeft = Int(s2Array[leftIndex].asciiValue!)
            s2FreqDict[asciiValueLeft]! -= 1
            if s1FreqDict[asciiValueLeft] == s2FreqDict[asciiValueLeft] {
                matches += 1
            } else if s1FreqDict[asciiValueLeft]! - 1 == s2FreqDict[asciiValueLeft] {
                matches -= 1
            }
            leftIndex += 1
        }
        return matches == 26
    }
}
