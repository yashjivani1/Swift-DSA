/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    var traversal = [Int]()
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        postOrderTraversalUtil(root)
        return traversal
    }
    
    func postOrderTraversalUtil(_ root: TreeNode?) {
        
        guard let node = root else {
            return
        }
        
        postOrderTraversalUtil(node.left)
        postOrderTraversalUtil(node.right)
        traversal.append(node.val)
    }
}