import Foundation

func isPrime(_ number: Int) -> Bool {
    if number <= 1 {
        return false
    }
    for i in 2..<Int(Double(number).squareRoot()) + 1 {
        if number % i == 0 {
            return false
        }
    }
    return true
}

// Print all prime numbers between 1 and 100
print("Prime numbers between 1 and 100:")
for number in 1...100 {
    if isPrime(number) {
        print(number, terminator: " ")
    }
}
print() // For a new line at the end