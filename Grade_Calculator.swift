import Foundation

struct Student { //to store Students
    let name: String
    let score: Double
}

var students: [Student] = []

// Input student data
while true {
    print("Enter student name (or press Enter to finish):")
    guard let name = readLine(), !name.isEmpty else {
        break }
    
    print("Enter \(name)'s score:")
    guard let scoreInput = readLine(), let score = Double(scoreInput) else {
        print("Invalid score. Please try again.")
        continue
    }
    
    students.append(Student(name: name, score: score))
}

// Calculate average score
let totalScore = students.reduce(0.0) { $0 + $1.score }
let averageScore = students.isEmpty ? 0 : totalScore / Double(students.count)

// Find highest and lowest scores
let highestScore = students.max(by: { $0.score < $1.score })?.score ?? 0
let lowestScore = students.min(by: { $0.score < $1.score })?.score ?? 0

// Display results
print("\nResults:")
print("Average score: \(String(format: "%.2f", averageScore))")
print("Highest score: \(highestScore)")
print("Lowest score: \(lowestScore)")
print("\nIndividual student results:")

for student in students {
    let status = student.score > averageScore ? "above" : (student.score < averageScore ? "below" : "at")
    print("\(student.name): \(student.score) (\(status) average)")
}