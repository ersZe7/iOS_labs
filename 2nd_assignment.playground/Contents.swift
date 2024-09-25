import UIKit

//Easy tasks

let fruits = ["Apple", "Orange", "Banana", "Strawberry", "Grape"]
print(fruits[2])


var favouriteNumbers: Set<Int> = [7, 8, 9, 10, 11]
favouriteNumbers.insert(17)
print(favouriteNumbers)


let programmingLanguages = [
    "Golang": 2007,
    "C++": 1983,
    "Swift": 2014
]

let swiftReleaseYear = programmingLanguages["Swift"]!
    print(swiftReleaseYear)


var colors = ["Red", "Blue", "White", "Green"]
colors[1] = "Purple"

print(colors)



//Medium tasks
//#1
let set1: Set = [1, 2, 3, 4]
let set2: Set = [3, 4, 5, 6]

let intersection = set1.intersection(set2)

print(intersection)

//2
var studentScores = [
    "Kevin": 90,
    "Wayne": 85,
    "Arnold": 95
]

studentScores["Leo"] = 100

print(studentScores)


//3
let array1 = ["apple", "orange"]
let array2 = ["banana", "grape"]

let Array = array1 + array2

print(Array)


//hard

//1
var countryPopulations = [
    "Kazakhstan": 20_651_937,
    "Turkey": 87_523_696,
    "Saudi Arabia": 34_102_084
]

countryPopulations["Egypt"] = 116_538_258

print(countryPopulations)


//2
let set3: Set = ["cat", "dog"]
let set4: Set = ["dog", "mouse"]


let unionSet = set3.union(set3)
let finalSet = unionSet.subtracting(set4)

print(finalSet)



//3

var studentGrades: [String: [Int]] = [
    "Alice": [85, 90, 78],
    "Bob": [88, 92, 85],
    "Charlie": [90, 85]
]

let studentName = "Bob"
let secondGrade = studentGrades[studentName]?[1]

print("The second grade for \(studentName) is \(secondGrade ?? -1).")





