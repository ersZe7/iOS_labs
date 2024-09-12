let name = "Yersultan"
let lastname = "Zhetibayev"
let age = 20
let birthYear = 2004
let isStudent: Bool = true
let height = 182.3

let currentYear = 2024
let myAge = currentYear - birthYear

let hobby = "watching TV serials 📺"
let numberOfHobbies = 3
let favoriteNumber = 10
let isHobbyCreative: Bool = false
let favoriteFootballClub = "Liverpool"
let favoriteColor = "white"

let futureGoals = "To visit Anfield in the future for a Champions League match."

let summary = """
My name is \(name) \(lastname). I am \(myAge) years old, born in \(birthYear). \
I am currently a \(isStudent ? "student" : "professional"). \
I am \(height) cm tall. I enjoy \(hobby), which is a \(isHobbyCreative ? "creative" : "non-creative") hobby. \
I have \(numberOfHobbies) hobbies in total. My favorite number is \(favoriteNumber), \
my favorite football club is \(favoriteFootballClub), and my favorite color is \(favoriteColor). \(futureGoals)
"""


print(summary)

