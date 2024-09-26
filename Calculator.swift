import Foundation

func add(_ a: Double, _ b: Double) -> Double {
    return a + b
}

func subtract(_ a: Double, _ b: Double) -> Double {
    return a - b
}

func multiply(_ a: Double, _ b: Double) -> Double {
    return a * b
}

func divide(_ a: Double, _ b: Double) -> Double? {
    guard b != 0 else { return nil }
    return a / b
}

func getNumber(prompt: String) -> Double? {
    print(prompt)
    guard let input = readLine(), let number = Double(input) else {
        print("Invalid input. Please enter a number.")
        return nil
    }
    return number
}

func getOperation() -> String? {
    print("Choose an operation (+, -, *, /):")
    guard let operation = readLine(), ["+", "-", "*", "/"].contains(operation) else {
        print("Invalid operation. Please choose +, -, *, or /.")
        return nil
    }
    return operation
}

while true {
    guard let num1 = getNumber(prompt: "Enter the first number:") else { continue }
    guard let num2 = getNumber(prompt: "Enter the second number:") else { continue }
    guard let operation = getOperation() else { continue }
    
    var result: Double?
    switch operation {
    case "+": result = add(num1, num2)
    case "-": result = subtract(num1, num2)
    case "*": result = multiply(num1, num2)
    case "/":
        result = divide(num1, num2)
        if result == nil {
            print("Error: Division by zero!")
            continue
        }
    default: break
    }
    
    if let result = result {
        print("Result: \(result)")
    }
    
    print("Do you want to perform another calculation? (y/n)")
    if let answer = readLine()?.lowercased(), answer != "y" {
        print("Thank you for using the calculator. Goodbye!")
        break
    }
}