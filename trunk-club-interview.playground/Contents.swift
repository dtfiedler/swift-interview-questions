//: Playground - noun: a place where people can play

import UIKit

/*
 Linked List in Swift!
 
 The goal of this exercise is to build a double linked list in Swift. The basic
 structure is laid out for you and you will be adding functionality. Tests are provide and should pass.
 
 What is a linked list?
 - A linear collection of data elements, whose order is not given by their physical placement in memory. Instead, each element points to the next.
 - A Double linked list also points to the previous element in the list.
 
 Problems
 a. Add an append method to LinkedList that takes a value (String) and adds an element
 b. Add a find method that takes a index and return the element at that index
 c. Add a remove method that takes an element and deletes it from the linked list, but does not break the link
 
 NOTE: a list of size 1 should have a head and tail of the same element
 */

class LinkedList {
    private var head: Element?
    private var tail: Element?
    
    var first: Element? {
        return head
    }
    
    var last: Element? {
        return tail
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func append(value: String) {
        // add 1a code here ...
        let newElement = Element(value: value)
        
        if !isEmpty {
            newElement.previous = tail
            tail?.next = newElement
            tail = newElement
        } else {
            head = newElement
            tail = newElement
        }
    }
    
    func find(at index: Int) -> Element? {
        guard index >= 0 else {
            return nil
        }
        guard index > 0 else { return head }
        // add 1b code here ...
        var temp = head
        var i = index
        while temp != nil {
            if i == 0 { return temp }
            temp = temp!.next
            i = i - 1
        }
        return temp
    }
    
    func remove(element: Element) {
        // add 1c code here ...
        let previous = element.previous
        let next = element.next
        
        if let prev = previous {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = previous
        if next == nil {
            tail = previous
        }
    }
}

class Element {
    var next: Element?
    weak var previous: Element?
    var value: String
    
    init(value: String) {
        self.value = value
    }
    
    deinit {
        print("element with value: \(value) deinit")
    }
}


/* TESTS */

var failing = true

// ***** test 0 *************************************************************************************

var list = LinkedList()
if list.isEmpty { failing = false }

print("0: \(failing ? "FAILED" : "PASS")")

// **************************************************************************************************


// ***** test 1 *************************************************************************************

failing = true
list = LinkedList()
list.append(value: "one")
list.append(value: "two")
list.append(value: "three")

if list.first?.value == "one" && list.last?.value == "three" { failing = false }

print("1: \(failing ? "FAILED" : "PASS")")

// *************************************************************************************************



// ***** test 2 *************************************************************************************
failing = true
list = LinkedList()
list.append(value: "red")
list.append(value: "green")
list.append(value: "blue")
list.append(value: "yellow")
list.append(value: "orange")

var blue = list.find(at: 2)
if let blue = blue {
    if blue.value == "blue" { failing = false }
}

print("2: \(failing ? "FAILED" : "PASS")")

failing = true
var nothing = list.find(at: 10)
if nothing == nil { failing = false }
print("2a: \(failing ? "FAILED" : "PASS")")
// *************************************************************************************************



// ***** test 3 ************************************************************************************
failing = true
var itemToRemove = list.find(at: 2)
if itemToRemove != nil {
    list.remove(element: itemToRemove!)
    let itemAfter = list.find(at: 2)
    if let yellow = itemAfter {
        if yellow.value == "yellow" { failing = false }
    }
}

print("3: \(failing ? "FAILED" : "PASS")")

// *************************************************************************************************
