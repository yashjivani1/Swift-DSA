class Solution {
    func titleToNumber(_ columnTitle: String) -> Int {
        var number: Int = 0
        
        for char in columnTitle.utf8 {
            number = number * 26 + Int(char) - 65 + 1
        }
        return number
    }
}

