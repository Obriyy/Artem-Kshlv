import Foundation

// Task 2

let minSizeOf12: Int8 = 12

let minSizeOfMinus100: Int8 = -100

let number128 = String(128, radix: 16, uppercase: true)
print(number128)

let minInt16: Int16 = Int16.min
print(minInt16)

let maxUInt64: UInt64 = UInt64.max
print(maxUInt64)

let minFloat: Float = 10235.34

let symbolX: Character = "X"

var string = "Hello, world!"

let studying: Bool = true

let numberToConvert = 12
let convertIntToString = String(numberToConvert)

// Task 3

var str = "Hello World. This is Swift programming language"
print(str.count)

// 2. below
str = str.replacingOccurrences(of: "i", with: "u")
print(str)


// 3. below
// insert one of available numbers [4, 7, 10] as in the task

let userInput = 7
var rmInStr = str

if userInput == 3+1 {
    rmInStr.remove(at: rmInStr.index(rmInStr.startIndex, offsetBy: 3))
    print(rmInStr)
} else if userInput == 6+1 {
    rmInStr.remove(at: rmInStr.index(rmInStr.startIndex, offsetBy: 6))
    print(rmInStr)
} else if userInput == 9+1 {
    rmInStr.remove(at: rmInStr.index(rmInStr.startIndex, offsetBy: 9))
    print(rmInStr)
} else {
    print("\(userInput) is not available index")
}

// 4. below
str.insert(contentsOf: " (modified)", at: str.endIndex)
print(str)

// 5. below
if str.isEmpty {
    print("There is nothing")
} else {
    print(str)
}

// 6. below
str.insert(contentsOf: ".", at: str.endIndex)
print(str)

// 7.
if str.hasPrefix("Hello") {
    print("\(str) - has Hello")
}

// 8.
if str.contains("World") {
    print("\(str) - has World")
}

// 9. "space" between "Hello World." is a symbol the result below (as in the task after 10 symbol)
var insertInStr = str
insertInStr.insert(contentsOf: "-", at: insertInStr.index(insertInStr.startIndex, offsetBy: 10))
print(insertInStr)

// 10.
str = str.replacingOccurrences(of: "Thus us", with: "It is")
print(str)

// 11.
print(str[str.index(str.startIndex, offsetBy: 9)])
print(str[str.index(str.startIndex, offsetBy: 14)])

// 12.

//let range = str.index(after: str.index(str.startIndex, offsetBy: 8)) ..< str.index(before: str.index(str.startIndex, offsetBy: 15))
print(str[str.index(after: str.index(str.startIndex, offsetBy: 8)) ..< str.index(before: str.index(str.startIndex, offsetBy: 15))])

// 13.
let oneMoreString = "My string"
let refString = oneMoreString + " is one more string"
print(String(format: "%p", oneMoreString))
print(String(format: "%p", refString))

// 14.
let one = refString.suffix(19)
print(one)

// Task 4

var integerNumber: Int?

// 4.2
let decimalNumber: Double?

// 4.3
integerNumber = 54

// 4.4
integerNumber = integerNumber! + (integerNumber ?? 0)
print(integerNumber!)

// 4.5
integerNumber = -integerNumber!
print(integerNumber!)

// 4.6
decimalNumber = Double(integerNumber!)
print(decimalNumber!)

// 4.7
let pairOfValues = (integer: integerNumber!, decimal: decimalNumber!)

// 4.8
let indexOfTuple0 = pairOfValues.0

if type(of: indexOfTuple0) == Int.self  {
    print("PairsOfValues have \(indexOfTuple0) of integer type")
} else {
    print("PairsOfValues don't have number of this type")
}

// 4.9
let indexOfTuple1 = pairOfValues.1

if type(of: indexOfTuple1) == Double.self  {
print("PairsOfValues have \(indexOfTuple1) of decimal type")
} else {
    print("PairsOfValues don't have number of this type")
}

// 4.10

if let possibleDouble = decimalNumber {
    print("\(decimalNumber!) has an decimal value of \(possibleDouble)")
} else {
    print("\(decimalNumber!) could not be converted to an integer")
}

// Task 5

var number: Int16 = Int16.max
print(number)

// 5.2, 5.3
var cc = number &+ 1

// 5.4
print(cc)

// 5.5
var minBits: UInt8 = 0b00000001

// 5.6
minBits >> 4
var inverted = ~minBits
inverted >> 4

// 5.7
var ex = 2 + 4 * 4 % 5 / 3 - 1 % 4

var my = -9 % (4 * 3) + 12 / 3 + 6

// 5.8, 9
var changedMy = ((-9 % (4 * 3) + 12) / (1 * 2))

