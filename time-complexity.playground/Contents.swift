
import Foundation

//: Playground - noun: a place where people can play

import UIKit

/*
 Big(O) notation
 O(1) - constant time - requires same amount of time to execute regardless of input size (i.e. remains constant)
 O(n) - linear time
 O(n^2) - quadratic time
 O(log(n)) - logarithmic time (worst performance with small data sets)
 */


// CONSTANT TIME COMPLEXITY
import QuartzCore
import Foundation
public class BenchTimer {
    public static func measureBlock(closure:()-> Void) -> CFTimeInterval{
        let runCount = 10
        var executionTimes = Array<Double>(repeating:0.0, count: runCount)
        for i in 0..<runCount{
            let startTime = CACurrentMediaTime()
            closure()
            let endTime = CACurrentMediaTime()
            let execTime = endTime - startTime
            executionTimes[i] = execTime
        }
        return (executionTimes.reduce(0, +)/Double(runCount))
    }
}

public extension CFTimeInterval {
    public var formattedTime: String {
        return self >= 1000 ? String(Int(self)) + "s"
            : self >= 1 ? String(format: "%.3gs", self)
            : self >= 1e-3 ? String(format: "%.3gms", self * 1e3)
            : self >= 1e-6 ? String(format: "%.3gus", self * 1e6)
            : self >= 1e-9 ? "0s"
            : String(format: "%.3gns", self * 1e9)
    }
}

func startsWithZero(array: [Int]) -> Bool {
    guard array.count != 0 else {
        return false
    }
    return array.first == 0 ? true: false
}

var smallArray = Array<Int>(repeating:0, count: 100)
var execTime = BenchTimer.measureBlock {
    _ = startsWithZero(array: smallArray)
}
print("Average execution time for small array:", execTime)
//
//var mediumArray = Array<Int>(repeating:0, count: 10000)
//var execTime2 = BenchTimer.measureBlock {
//    _ = startsWithZero(array: mediumArray)
//}
//print("Average execution time for medium array:", execTime2)
//
//var largeArray = Array<Int>(repeating:0, count: 10000000)
//var execTime3 = BenchTimer.measureBlock {
//    _ = startsWithZero(array: largeArray)
//}
//print("Average execution time for large array:", execTime3)
//
func generateDict(size: Int) -> Dictionary<String, Int> {
    var result = Dictionary<String, Int>()
    //if size is less than or equal to zero
    guard size > 0 else {
        return result
    }
    //add to hashmap
    for i in 0..<size {
        let key = String(i)
        result[key] = i
    }
    return result
}

let smallDict = generateDict(size: 100)
execTime = BenchTimer.measureBlock {
    _ = smallDict["50"]
}
print("Average execution time for small hashmap:", execTime)

//let mediumDict = generateDict(size: 5000)
//execTime = BenchTimer.measureBlock {
//    _ = mediumDict["4030"]
//}
//print("Average execution time for medium hashmap:", execTime)
//
//let hugeDict = generateDict(size: 1000000)
//execTime = BenchTimer.measureBlock {
//    _ = hugeDict["123543"]
//}
//print("Average execution time for large hashamp:", execTime)
//
////LINEAR TIME
//func generateRandomArray(size: Int, maxValue: UInt32) -> [Int]{
//    guard size > 0 else {
//        return [Int]()
//    }
//
//    var result = [Int](repeating: 0, count: size)
//    for i in 0..<size {
//        result[i] = Int(arc4random_uniform(maxValue))
//    }
//    return result
//}
//
//func sum(array: [Int]) -> Int{
//    var result = 0
//    for i in 0..<array.count{
//        result += array[i]
//    }
//    return result
//}
//
//var array = generateRandomArray(size: 10, maxValue: 1000)
//execTime = BenchTimer.measureBlock {
//    _ = sum(array: array)
//}
//print("Time for calculating sum of small array" , execTime)
//
//array = generateRandomArray(size: 10000, maxValue: 1000)
//execTime = BenchTimer.measureBlock {
//    _ = sum(array: array)
//}
//print("Time for calculating sum of medium array" , execTime)
//
//array = generateRandomArray(size: 10000000, maxValue: 1000)
//execTime = BenchTimer.measureBlock {
//    _ = sum(array: array)
//}
//print("Time for calculating sum of large array" , execTime)


//Quadratic time
func multTable(size: Int) -> [Int] {
    var table = [Int]()
    var array = [Int](1...size)
    for i in 0..<size {
        for j in 0..<size {
            let val = array[i] * array[j]
            table.append(val)
        }
    }
    return table
}

let sizes = [10, 20, 30]
for i in 0..<sizes.count{
    let size = sizes[i]
    let execTime = BenchTimer.measureBlock {
        _ = multTable(size: size)
    }
    print("Average execution for \(size) elements: \(execTime.formattedTime)")
}

