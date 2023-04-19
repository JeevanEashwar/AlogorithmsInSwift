public class TrapRainWater {
    public init() {}
    /// https://leetcode.com/problems/trapping-rain-water/
    public func trapRainWater(height:[Int]) -> Int {
        var left_index: Int = 0
        var right_index: Int = height.count - 1
        var result: Int = 0
        var left_max: Int = 0
        var right_max: Int = 0
        while (left_index < right_index) {
            // Always trap water from lower heights
            if height[left_index] < height[right_index] {
                // Since left height is less, perform action at left_index position
                if height[left_index] > left_max {
                    // We have a new left maximum
                    left_max = height[left_index]
                } else {
                    result += left_max - height[left_index]
                }
                left_index += 1
            } else {
                // Since right height is less, perform action at right_index position
                if height[right_index] > right_max {
                    // We have a new right maximum
                    right_max = height[right_index]
                } else {
                    result += right_max - height[right_index]
                }
                right_index -= 1
            }
        }
        return result
    }
}


/**
 int trap(vector<int>& height)
 {
     int left_index = 0, right_index = height.size() - 1;
     int ans = 0;
     int left_max = 0, right_max = 0;
     while (left_index < right_index) {
         // a taller bar exists on left pointer's right side
         if (height[left_index] < height[right_index]) {
             height[left_index] >= left_max ? (left_max = height[left_index]) : ans += (left_max - height[left_index]);
             ++left_index;
         }
         // a taller bar exists on right pointer's left side
         else {
             height[right_index] >= right_max ? (right_max = height[right_index]) : ans += (right_max - height[right_index]);
             --right_index;
         }
     }
     return ans;
 }
 */
