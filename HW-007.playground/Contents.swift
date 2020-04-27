import Foundation

// Task 1

func factorialNumber(_ n: Int) -> Int {
    if n == 0 {
        return 1
    }
    else {
        return n * factorialNumber(n - 1)
    }
}
factorialNumber(7)

// Task 2

var myArray = [42, 16, 8, 23, 15, 4]

func sortAnArray<T: Comparable>(myArray:inout [T]) -> [T] {
    
    for element in 0..<myArray.count {
        let exeptNumber = (myArray.count - 1) - element
        
        for element2 in 0..<exeptNumber {
            
            let next = myArray[element2]
            
            if next > myArray[element2 + 1] {
                
                let tmp = myArray[element2 + 1]
                myArray[element2 + 1] = next
                myArray[element2] = tmp
            }
        }
    }
    return myArray
}

sortAnArray(myArray: &myArray)

// Task 3

var someSymbol: Any

var ukrAlphabet = [
    "а", "A", "б", "Б", "в", "В", "г", "Г", "ґ", "Ґ",
    "д", "Д", "е", "Е", "є", "Є", "ж", "Ж", "з", "З",
    "и", "і", "І", "ї", "Ї", "й", "Й", "к", "К", "л",
    "Л", "м", "М", "н", "Н", "о", "О", "п", "П", "р",
    "Р", "с", "С", "т", "Т", "у", "У", "ф", "Ф", "х",
    "Х", "ц", "Ц", "ч", "Ч", "ш", "Ш", "щ", "Щ", "ь",
    "ю", "Ю", "я", "Я"]

var enAlphabet = ["a", "A", "b", "B", "c", "C", "d",
"D", "e", "E", "f", "F", "g", "G", "h", "H", "i", "I",
"j", "J", "k", "K", "l", "L", "m", "M", "n", "N", "o",
"O", "p", "P", "q", "Q", "r", "R", "s", "S", "t", "T",
"u", "U", "v", "V", "w", "W", "x", "X", "y", "Y", "z", "Z"]

func checkingSymbol(_ someSymbol: Any) -> Any {
    switch someSymbol {
    case _ as Int:
    print("You input some integer value")
    case _ as String:
    print("You input a character")
    default:
        print("Unknown type of this value")
    }
    
    if ukrAlphabet.contains(someSymbol as! String) {
        print("This \(someSymbol) symbol - it's from ukrainian alphabet")
    } else if enAlphabet.contains(someSymbol as! String) {
        print("This \(someSymbol) symbol - it's from english alphabet")
    } else {
        print("This symbol not contains in ukr or eng alphabet")
    }
    
    let uppercase = someSymbol as! String
    
    if uppercase.uppercased() == uppercase {
        print("This \(someSymbol) is uppercased")
    } else {
        print("This \(someSymbol) is lowercased")
    }
    return "So it's OK"
}

print(checkingSymbol("s"))


// Task 4

var inputText = "Brave New World!"

func checkingText(_ inputText: String) -> [Character: Int] {
    let arrayCharacterCount = inputText.reduce(into: [:]) {
    counts, letter in counts[letter, default: 0] += 1  }

    return arrayCharacterCount
}

var en = checkingText(inputText)


// Task 5

func calculate(op1: Int, op2: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(op1, op2)
}
calculate(op1: 3, op2: 4, operation: *)

//func calculate(op1: Int, op2: Int, operation: (Int, Int) -> Int) -> Int {
//
//    func add(op1: Int, op2: Int) -> Int {
//    return op1 + op2
//    }
//
//    func subtract(op1: Int, op2: Int) -> Int {
//    return op1 - op2
//    }
//
//    func multiply(op1: Int, op2: Int) -> Int {
//    return op1 * op2
//    }
//
//    func split(op1: Int, op2: Int) -> Int {
//    return op1 / op2
//    }
//
//    func modulo(op1: Int, op2: Int) -> Int {
//    return op1 % op2
//    }
//
//    func quatro(op1: Int, op2: Int) -> Int {
//    return op1 * op1
//    }
//
//    var operation: (Int, Int) -> Int
//
//    for i in 0..<5 {
//    if i == 0 {
//        operation = add
//    } else if i == 1 {
//        operation = subtract
//    } else if i == 2 {
//        operation = multiply
//    } else if i == 3 {
//        operation = split
//    } else if i == 4 {
//        operation = modulo
//    } else {
//        print("void")
//    }
//}
//    _ = operation
//
//}

