import Foundation

public class LongestSubString {
    public init() {}
    /// https://leetcode.com/problems/longest-substring-without-repeating-characters/submissions/
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let input: [Character] = Array(s)
        if input.isEmpty {
            return 0
        }
        var longest: [Character] = []
        var i: Int = 0
        while i < input.count {
            var j: Int = i + 1
            var current: [Character] = [input[i]]
            while j < input.count, !current.contains(input[j]) {
                current.append(input[j])
                j += 1
            }
            longest = longest.count < current.count ? current : longest
            i += 1
        }
        return longest.count
    }
}
