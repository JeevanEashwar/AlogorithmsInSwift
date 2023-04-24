import Foundation


// Using XOR bit operator ^
func missingNumberUsingXOR(_ input: [Int]) -> Int {
    let sequence: [Int] = Array(1 ... input.count)
    var result = 0
    for number in input {
        result = result ^ number
    }
    for number in sequence {
        result = result ^ number
    }
    return result
}


// Using sums

func missingNumberusingSUM(_ input: [Int]) -> Int {
    let sequence: [Int] = Array(1...input.count)
    var sumOfInputs = 0
    var sumOfSequence = 0
    for number in input {
        sumOfInputs += number
    }
    for number in sequence {
        sumOfSequence += number
    }
    
    return (sumOfSequence - sumOfInputs)
}



































