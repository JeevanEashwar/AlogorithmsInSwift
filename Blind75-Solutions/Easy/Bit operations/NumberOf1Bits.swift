import Foundation


// Using Remainder when divided by 2
func numberOd1BitsWhenDividedBy2(_ n: Int) -> Int {
    var count = 0
    var input = n
    while input != 0 {
        if input%2 == 1 {
            count += 1
        }
        input = input / 2
    }
    return count
}

// Using bitwise '&' operator

func numberOf1BitsUsingANDOperator(_ n: Int) -> Int {
    var count = 0
    var input = n
    while input != 0 {
        input = input & (input - 1)
        count += 1
    }
    return count
}






























