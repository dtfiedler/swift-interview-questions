//: Playground - noun: a place where people can play

import UIKit

//build a function that checks if a string is a palindrome
let strings = ["abba", "racecar" , "donkey", "hannah"]

func isPalindrome(s: String) -> Bool{
    //break it into array of characters
    let charArray = Array(s)
    //get total number of characters
    let count = s.count - 1
    //go halfway through, check it's alternative is the same
    for i in 0...count / 2 {
        if charArray[i] != charArray[count - i]{
            return false
        }
    }
    return true
}

for s in strings {
    if isPalindrome(s: s){
        print("\(s) is a palindrome")
    } else {
        print("\(s) is not a palindrome")
    }
}

