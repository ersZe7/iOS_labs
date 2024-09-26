import Foundation

func fibonacci(_ n: Int) -> [Int] {
    guard n > 0 else {
         return [] 
        }
    
    var sequence = [0, 1]
    guard n > 2 else {
         return Array(sequence.prefix(n))
        }
    
    for _ in 3...n {
        let nextNumber = sequence[sequence.count - 1] + sequence[sequence.count - 2]
        sequence.append(nextNumber)
    }
    
    return sequence
}

// Test the function
print("First 10 Fibonacci numbers:")
print(fibonacci(10))

print("\nFirst 1 Fibonacci number:")
print(fibonacci(1))

print("\nFirst 0 Fibonacci numbers (empty array):")
print(fibonacci(0))