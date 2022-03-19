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
    var arr = [Int]()
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        if (root == nil) {
            return arr
        }
        preOrderTraversalUtil(root)
        return arr
    }
    
    func preOrderTraversalUtil(_ root: TreeNode?) {
        guard let node = root else{
            return
        }
        
        arr.append(node.val)
        preOrderTraversalUtil(node.left)
        preOrderTraversalUtil(node.right)
    }
}