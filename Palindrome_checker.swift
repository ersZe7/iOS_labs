import Foundation

func isPalindrome(_ text: String) -> Bool {
    let cleanedText = text.lowercased().components(separatedBy: CharacterSet.alphanumerics.inverted).joined()
    return cleanedText == String(cleanedText.reversed())
}

// Test cases
let testCases = [
    "A man, a plan, a canal: Panama",
    "race a car",
    "Was it a car or a cat I saw?",
    "Hello, World!",
    "Madam, I'm Adam"
]

for testCase in testCases {
    print("\"\(testCase)\" is \(isPalindrome(testCase) ? "a palindrome" : "not a palindrome")")
}