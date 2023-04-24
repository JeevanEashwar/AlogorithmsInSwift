import Foundation


// Using recursion
func climbStairsUsingRecursion(_ n: Int) -> Int {
    /**
            1 - 1
            2 - 2
            3 - 3
     */
    if n<=3 {
        return n
    }
    
    // number of ways of climbing nth stair
    //          = number of ways of climbing (n-1)th stair
    //           + number of ways of climbing (n-2)th stair
    return climbStairsUsingRecursion(n-1) + climbStairsUsingRecursion(n-2)
}


// Using dynamic programming

func climbStairsUsingDynamicProgramming(_ n: Int) -> Int {
    if n<=3 {
        return n
    }
    var one = 1
    var two = 1
    for i in 1..<n {
        var temp = one
        one = temp + two
        two = temp
    }
    return one
}
































