import Foundation

print("Enter a sentence:")
guard let sentence = readLine() else {
    print("Invalid input.")
    exit(1)
}

// Function to clean and split the sentence into words
func getWords(from sentence: String) -> [String] {
    let lowercased = sentence.lowercased()
    let punctuationSet = CharacterSet.punctuationCharacters
    let withoutPunctuation = lowercased.components(separatedBy: punctuationSet).joined(separator: " ")
    return withoutPunctuation.split(separator: " ").map { String($0) }
}

// Count word frequencies
let words = getWords(from: sentence)
var wordFrequencies: [String: Int] = [:]

for word in words {
    wordFrequencies[word, default: 0] += 1
}

// Display results
print("\nWord frequencies:")
for (word, count) in wordFrequencies.sorted(by: { $0.key < $1.key }) {
    print("\(word): \(count)")
}