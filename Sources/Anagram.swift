
public class AnagramSolution2 {
    public init() {}
    ///  https://leetcode.com/problems/group-anagrams/
    ///  Solution - The trick here is to know that any string in the anagram group when sorted will result in the same string. Using this result as key to group them in a dictionary will give us the expected output.
    public func groupAnagram(input: [String]) -> [[String]] {
        /// If input = ["eat","tea","tan","ate","nat","bat"]
        /// dict will be = ["ant": ["tan", "nat"], "abt": ["bat"], "aet": ["eat", "tea", "ate"]]
        var dict: [String: [String]] = [:]
        for anagram in input {
            let key = String(anagram.sorted())
            if let _ = dict[key] {
                dict[key]?.append(anagram)
            } else {
                dict[key] = [anagram]
            }
        }
        return Array(dict.values)
    }
    
    /// https://leetcode.com/problems/valid-anagram/
    public func isAnagram(one: String, two: String) -> Bool {
        String(one.sorted()) == String(two.sorted())
    }
}

/**
 Given an array of strings strs, group the anagrams together. You can return the answer in any order.
 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.**/
public class AnagramSolution1 {
    public init() {}
    public func groupAnagram(input: [String]) -> [[String]]{
        var output: [[String]] = []
        for element in input { // Loop1
            if output.isEmpty {
                // For the first element in the input, the output array will be empt.
                // So, we will append the first element of input i.e., [element] as an array to output array
                output.append([element])
            } else {
                // From the second element onwards in the input,
                // we will continue to build the output array based on anagramCheck
                var anagramGroupFound: Bool = false
                for (outputIndex, group) in output.enumerated() { // Loop2
                    if let firstObjOfGroup = group.first {
                        if isAnagram(one: element, two: firstObjOfGroup) {
                            var modifiedGroup = group
                            modifiedGroup.append(element)
                            output[outputIndex] = modifiedGroup
                            anagramGroupFound = true
                            break // Break the inner loop - Loop2
                        }
                    }
                }
                if !anagramGroupFound {
                    // For an element, if the anagram group was not found, create a new group with this element as the only member and append it to the output
                    output.append([element])
                }
            }
        }
        return output
    }

    public func isAnagram(one: String, two: String) -> Bool {
        let sortedOne = Array(one).sorted()
        let sortedTwo = Array(two).sorted()
        if sortedOne.count != sortedTwo.count {
            return false
        }
        for (index, element) in sortedOne.enumerated() {
            if sortedTwo[index] != element {
                return false
            }
        }
        return true
    }
}
