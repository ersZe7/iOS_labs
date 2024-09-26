import Foundation


    for number in 1...100 {   //loop [1, 100]
        if number % 3 == 0 && number % 5 == 0 {
            print("FizzBuzz")
        } else if number % 3 == 0 {
            print("Fizz")
        } else if number % 5 == 0 {
            print("Buzz")
        } else {
            print(number)
        }
    }
// just skipping numbers that divides 3 or 5



