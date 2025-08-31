import UIKit

//Two sum

func twoSum(_ nums: [Int], _ taget : Int) -> [Int] {
    var numToIndex : [Int:Int] = [:]
    
    for (index, num) in nums.enumerated() {
        let complement = target - num
        if let complementIndex = numToIndex[complement] {
            return [complementIndex, index]
        }
        numToIndex[num] = index
    }
    
    
    return []
}

let nums = [2,7,11,5]
let target = 14
let result = twoSum(nums, target)
print(result)
