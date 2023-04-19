/// Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.
public class TopKFrequencySolution {
    public init() {}
    /// https://leetcode.com/problems/top-k-frequent-elements/
    public func topKFrequentOccurences(input: [Int], k: Int) -> [Int] {
        var dict: [Int: Int] = [:] // [Element: NumberOfOccurences]
        for element in input {
            dict[element, default: 0] += 1
        }
        // Custom sort on Dictionary, Sort by frequency or alternatively alphabetically
        let sorted: [(key: Int, value: Int)] = dict.sorted { element1, element2 in
            if element1.value == element2.value {
                return element1.key < element2.key
            }
            return element1.value > element2.value
        }
        let sortedArray = Array(sorted[0..<k])
        return sortedArray.map { element in
            element.key
        }
    }
}

