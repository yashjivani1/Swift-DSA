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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var traversal = [[Int]]()
        guard let node = root else {
            return traversal
        }
        
        var queue = [TreeNode]()
        queue.append(node)
        var level = 0
        while(!queue.isEmpty) {
             
            var levelTraversal = [Int]()
            for _ in 0..<queue.count {
                let firstNode = queue[0] 
                queue.removeFirst()
                levelTraversal.append(firstNode.val)
                if let leftNode = firstNode.left {
                    queue.append(leftNode)
                }
            
                if let rightNode = firstNode.right {
                    queue.append(rightNode)
                }   
            }
            
            traversal.append(levelTraversal)
        }
        
        return traversal
    }
}