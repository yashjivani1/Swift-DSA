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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        inOrderTraversalUtil(root)
        return traversal
    }
    
    func inOrderTraversalUtil(_ root: TreeNode?) {
        guard let node = root else {
            return 
        }
        
        inOrderTraversalUtil(node.left)
        traversal.append(node.val)
        inOrderTraversalUtil(node.right)
    }
}