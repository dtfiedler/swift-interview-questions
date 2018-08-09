//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
 Given a non-empty string check if it can be constructed by taking a substring of it
 and appending multiple copies of the substring together. You may assume the given
 string consists of lowercase English letters only and its length will not exceed
 10000.
 
 Example 1:
 
 Input: "abab"
 Output: True
 Explanation: It's the substring "ab" twice.
 Example 2:
 
 Input: "aba"
 Output: False
 Example 3:
 
 Input: "abcabcabcabc"
 Output: True
 Explanation: It's the substring "abc" four times. (And the substring "abcabc" twice.)
*/

func substring(s: String) -> Bool {
    let string = s + s
    var chars = Array(string)
    //strip first letter
    chars.removeFirst()
    //strip last letter
    chars.removeLast()
    //now check if new string contains the original string(i.e. it is still composed of substrings)
    let temp = String(chars)
    return temp.contains(s)
}

let strings = ["abab", "aba", "abcabcabcabc"]
for s in strings {
    if substring(s: s){
        print("\(s) can be composed of a substring of itself")
    } else {
        print("\(s) cannot be composed of a substring of itself")
    }
}
