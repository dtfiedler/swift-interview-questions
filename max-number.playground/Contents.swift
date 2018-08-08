//: Playground - noun: a place where people can play

import UIKit

/*
 In a given integer array nums, there is always exactly one largest element.
 
 Find whether the largest element in the array is at least twice as much as every other number in the array.
 
 If it is, return the index of the largest element, otherwise return -1.
 
 Example 1:
 
 Input: nums = [3, 6, 1, 0]
 Output: 1
 Explanation: 6 is the largest integer, and for every other number in the array x,
 6 is more than twice as big as x.  The index of value 6 is 1, so we return 1.
 
 
 Example 2:
 
 Input: nums = [1, 2, 3, 4]
 Output: -1
 Explanation: 4 isn't at least as big as twice the value of 3, so we return -1.
 
 
 Note:
 
 nums will have a length in the range [1, 50].
 Every nums[i] will be an integer in the range [0, 99].
 */
func dominantIndex(_ nums: [Int]) -> Int {
    var dictionary: [Int: Int] = [:]
    var max = -1
    var smallMax = -1
    for i in 0...nums.count - 1 {
        dictionary[nums[i]] = i
        if nums[i] > max {
            smallMax = max
            max = nums[i]
        } else if nums[i] > smallMax {
            smallMax = nums[i]
        }
    }
    
    if max >= (2 * smallMax), let index = dictionary[max] {
        return index
    }
    return -1
}

let nums = [[3, 6, 1, 0], [1, 2, 3, 4]]
for arr in nums {
    let index = dominantIndex(arr)
    if index != -1 {
        print("The max number in array is \(arr[index]) located at \(index) and is at least twice as much as the next largest number")
    } else {
        print("The max number in array of \(arr[index]) located at \(index) is NOT at least twice as much as the next largest number")
    }
}
