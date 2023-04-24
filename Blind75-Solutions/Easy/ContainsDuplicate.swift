import Foundation
// Approach 1 - Using swift 'Dictionary'
func containsDuplicateUsingDictionary(_ nums: [Int]) -> Bool {
    // Create a dictionary having the number and its frequency as key-value pair
    var occurenceBook: [Int: Int] = [:]
    for num in nums {
        if occurenceBook.keys.contains(num) {
            return true
        } else {
            occurenceBook[num] = 1
        }
    }
    return false
}

// Approach 2 - Using Swift 'Set'
func containsDuplicateUsingSet(_ nums: [Int]) -> Bool {
    Set(nums).count != nums.count
}
