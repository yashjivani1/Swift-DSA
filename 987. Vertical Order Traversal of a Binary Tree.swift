class Solution {
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var traversal: [(column: Int, row: Int, node: TreeNode)] = [(0, 0, root)]
        var index = 0
        
        while index <= traversal.count-1 {
            let (col, row, node) = traversal[index]
            node.left.map { traversal.append((col - 1, row + 1, $0)) }
            node.right.map { traversal.append((col + 1, row + 1, $0)) }
            index += 1
        }
        
        traversal.sort() { lhs, rhs in 
            if lhs.column < rhs.column {
                return true
            } else if lhs.column > rhs.column {
                return false
            } else {
                if lhs.row < rhs.row {
                    return true
                } else if lhs.row > rhs.row {
                    return false
                } else {
                    return lhs.node.val < rhs.node.val 
                }
            }
        }
        
        var column = traversal[0].column
        var colTraversal: [Int] = []
        var res: [[Int]] = []
        for tuple in traversal {
            if tuple.column != column {
                res.append(colTraversal)
                colTraversal = []
                column = tuple.column
            }
            colTraversal.append(tuple.node.val)
        }
        res.append(colTraversal)
        return res
    }
}