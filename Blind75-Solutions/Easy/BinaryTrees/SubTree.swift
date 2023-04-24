import Foundation


func isSubTree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
    if root == nil && subRoot == nil { return true }
    guard let root = root else {return false}
    guard let subRoot = subRoot else {return false}
    
    if isSameTree(root, subRoot) {return true}
    
    return isSubTree(root.left, subRoot) || isSubTree(root.right, subRoot)
}



