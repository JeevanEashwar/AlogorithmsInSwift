import Foundation




// Approach 1 - using two pointers
func twoSumUsingTwoPointers(_ nums: [Int], target: Int) -> [Int] {
    for leftPointer in 0 ..< nums.count {
        for rightPointer in leftPointer+1 ..< nums.count {
            if nums[leftPointer] + nums[rightPointer] == target {
                return [leftPointer, rightPointer]
            }
        }
    }
    return []
}


// Approach 2 - using Dictionary/hashmap
func twoSumUsingDictionary(_ nums: [Int], target: Int) -> [Int] {
    // Store number and its position/index as key-value pair
    var numberIndexBook = [Int: Int]()
    for i in 0 ..< nums.count {
        let difference = target - nums[i]
        if let j = numberIndexBook[difference] {
            return [j,i]
        } else {
            numberIndexBook[nums[i]] = i
        }
    }
    return []
}

