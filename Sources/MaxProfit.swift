import Foundation

public class MaxProfit {
    public init() {}
    /// https://leetcode.com/problems/best-time-to-buy-and-sell-stock/submissions/
    public func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit: Int = 0
        var buyIndex: Int = 0
        for sellIndex in 1 ..< prices.count {
            if prices[sellIndex] < prices[buyIndex] {
                buyIndex = sellIndex
            }
            let profit = prices[sellIndex] - prices[buyIndex]
            maxProfit = max(maxProfit, profit)
        }
        return maxProfit
    }
}
