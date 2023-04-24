import Foundation

/*
func numberOf1BitsUsingANDOperator(_ n: Int) -> Int {
    var count = 0
    var input = n
    while input != 0 {
        input = input & (input - 1)
        count += 1
    }
    return count
}
*/

// Using brute force way of calculating bit count for every number from 0 to n
func countingBitsBruteForce(_ n: Int) -> [Int] {
    var result: [Int] = []
    for i in 0 ... n {
        result.append(numberOf1BitsUsingANDOperator(i))
    }
    return result
}

// Using caching and odd/even technique
func numberOfBitsUsingCache(_ n: Int) -> [Int] {
    /*
     result[n] = result[n/2], if n is even number
     result[n] = result[n/2] + 1, if n is odd number
     **/
    var result: [Int] = [0,1]
    if n < 2 {
        return Array(result[...n])
    }
    for i in 2 ... n {
        if i%2 == 0 {
            result.append(result[i/2])
        } else {
            result.append(result[i/2] + 1)
        }
    }
    return result
}























