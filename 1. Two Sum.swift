class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        var dict = [Int: Int]()
        
        for i in 0..<nums.count {
            if let index = dict[target - nums[i]] {
                return [index, i]
            } 
            dict[nums[i]] = i
        }
        
        return []
    }
}