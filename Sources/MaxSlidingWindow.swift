import Foundation
// https://leetcode.com/problems/sliding-window-maximum/
public class MaxSlidingWindow {
    public init() {}
    /// Brute force way of finding the max silding window is to keep left and right indices to keep track of current window and then get the max value in the current window  by iterating from left to right index.
    /// But if we keep track of currentMax in the current window, all we need to do is check the next incoming number and compare it with currentMax. if is greater simple it will become the current max
    /// When we keep moving the window from the left to right, the values get removed from the left. What if the value removed from the left was the previous current max? In this case we need to calculate the currentMax from this new leftIndex to new Right Index
    public func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        // Edge case, if k = 1, we need not check for a max in a length 1 window.
        if k == 1 {
            return nums
        }
        var leftIndex: Int = 0
        var rightIndex: Int = k - 1
        // (A) Find the first maximum
        var currentMax: Int = Int.min
        var result: [Int] = []
        /// This helper function will iterate from leftIndex to rightIndex and returns the maximum value
        func getCurrentMax(_ leftIndex: Int, _ rightIndex: Int) -> Int {
            var max: Int = Int.min
            for i in leftIndex ... rightIndex {
                if nums[i] > max {
                    max = nums[i]
                }
            }
            return max
        }
        // (A1) - Get the maximum value in the first window and append it to the result
        currentMax = getCurrentMax(leftIndex, rightIndex)
        result.append(currentMax)
        // (B) - Slide the window to the right one index at a time and get the max in the current window
        while (rightIndex + 1) < nums.count {
            let numToBeRemovedFromWindow: Int = nums[leftIndex]
            let numToBeAddedToWindow: Int = nums[rightIndex + 1]
            if numToBeAddedToWindow >= currentMax {
                // If the number that we are going to add, `nums[rightIndex+1)`, to our window is greater than current maximum, then with no questions asked it is going to be maximum irrespective of what was removed from the left
                currentMax = numToBeAddedToWindow
            } else {
                // Else if the number that we are going to add, `nums[rightIndex+1)`, to our window is less than current maximum, then we need check if the num that we are about to remove was the currentMax.
                // If we had removed a currentMax from the current window, then we need to calculate new maximum for the new window
                if numToBeRemovedFromWindow == currentMax {
                    currentMax = getCurrentMax(leftIndex+1, rightIndex+1)
                }
                // We need not worry about the case where `numToBeRemovedFromWindow` is less than currentMax, in which case the currentMax is going to stay as currentMax
                // We also need not worry about the case where `numToBeRemovedFromWindow` is grater than currentMax because there is no possibility at all. `numToBeRemovedFromWindow` can never be greater than currentMax. Think!
            }
            result.append(currentMax)
            leftIndex += 1
            rightIndex += 1
        }
        return result
    }
}
