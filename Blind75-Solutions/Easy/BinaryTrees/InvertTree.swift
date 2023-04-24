import Foundation


func invertTree(_ root: TreeNode?) -> TreeNode? {
    guard root != nil else { return root }
    
    // Create inverted left and right objects
    let invertedLeft = invertTree(root?.left)
    let invertedRight = invertTree(root?.right)
    
    root?.left = invertedRight
    root?.right = invertedLeft
    
    return root
    
}





