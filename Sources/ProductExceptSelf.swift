
public class ProductExceptSelf {
    public init() {}
    /// https://leetcode.com/problems/product-of-array-except-self
    public func productExceptSelf(_ nums: [Int]) -> [Int] {
        //[1,2,3,4]
        var ans: [Int] = Array(repeating: 1, count: nums.count)
        var leftProduct: Int = 1
        var rightProduct: Int = 1
        // Multiply values from left till currentIndex (except current Index value)
        for i in 0 ..< nums.count {
            ans[i] *= leftProduct
            leftProduct *= nums[i]
        }
        // Multiply values from right till currentIndex (except current Index value)
        for i in stride(from: (nums.count - 1), to: -1, by: -1) {
            ans[i] *= rightProduct
            rightProduct *= nums[i]
        }
        return ans
    }
    
    public func productExceptSelf_n_square_time(_ nums: [Int]) -> [Int] {
        var ans: [Int] = []
        for i in 0 ..< nums.count {
            var sum = 1
            for (j, num) in nums.enumerated() {
                if i != j {
                    sum = sum * num
                }
            }
            ans.append(sum)
        }
        return ans
    }
}
