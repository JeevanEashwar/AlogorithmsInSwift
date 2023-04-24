import Foundation


// Approach 1 - Using Dictionaries / Hashmaps
func anagramCheckUsingDictionaries(one: String, two: String) -> Bool {
    
    if one.count != two.count {
        return false
    }
    
    var occurenceBook1: [Character: Int] = [:]
    var occurenceBook2: [Character: Int] = [:]
    
    for (_, character) in one.enumerated() {
        occurenceBook1[character] = (occurenceBook1[character] ?? 0) + 1
    }
    
    for (_, character) in two.enumerated() {
        occurenceBook2[character] = (occurenceBook2[character] ?? 0) + 1
    }
    
    for (_, character) in one.enumerated() {
        if occurenceBook1[character] != occurenceBook2[character] {
            return false
        }
    }
    return true
}


// Approach 2 - using sorting
func anagramCheckUsingSorting(one: String, two: String) -> Bool {
    let sortedOne = Array(one).sorted()
    let sortedTwo = Array(two).sorted()
    
    if one.count != two.count {
        return false
    }
    
    for (index, element) in sortedOne.enumerated() {
        if element != sortedTwo[index] {
            return false
        }
    }
    return true
}





func checkAnagramSingleLine(one: String, two: String) -> Bool {
    String(one.sorted()) == String(two.sorted())
}














