//: Playground - noun: a place where people can play

import UIKit

//Question: Swap vowels in a string
var string = "hello"
//result should be holle
let vowels: [Character] = ["a", "e", "i", "o", "u"]
func swapVowels(s: String) -> String {
    var chars = Array(s)
    var indicies = [Int]()
    //get indicies of all vowels
    for i in 0...chars.count - 1 {
        if vowels.contains(chars[i]){
            indicies.append(i)
        }
    }
    //go through until no more vowels left to swap
    while indicies.count > 1 {
        let first = indicies.removeFirst()
        let last = indicies.removeLast()
        let temp = chars[first]
        chars[first] = chars[last]
        chars[last] = temp
    }
    
    let swapped = String(chars)
    return swapped
}
string = swapVowels(s: string)
