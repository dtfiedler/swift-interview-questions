//: Playground - noun: a place where people can play

import UIKit
/*
 The set S originally contains numbers from 1 to n. But unfortunately, due to the data error, one of the numbers in the set got duplicated to another number in the set,
 which results in repetition of one number and loss of another number.
 
 Given an array nums representing the data status of this set after the error. Your task is to firstly find the number occurs twice and then find the number that is
 missing. Return them in the form of an array.
 
 Example 1:
 Input: nums = [1,2,2,4]
 Output: [2,3]
 Note:
 The given array size will in the range [2, 10000].
 The given array's numbers won't have any order.
 */

func findErrorNums(_ nums: [Int]) -> [Int] {
    var dictionary: [Int: Int] = [:]
    var repeatedNumber = -1
    var shouldBe = -1
    for i in 1...nums.count {
        dictionary[i] = -1
    }
    for n in nums {
        if dictionary[n] == -1 {
            dictionary[n] = n
        } else {
            repeatedNumber = n
        }
    }
    
    for i in 0...dictionary.count - 1 {
        if dictionary[i + 1] == -1 {
            shouldBe = i + 1
        }
    }
    return [repeatedNumber, shouldBe]
}

let arrays = [[1, 2, 2, 4], [1, 1], [1, 3, 3, 4]]
for arr in arrays {
    let mismatches = findErrorNums(arr)
    print("Original array: \(arr)\nMismatched numbers: \(mismatches)")
}
