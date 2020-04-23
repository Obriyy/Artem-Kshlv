import UIKit

class Fraction {
    
    var value: Double = 0.0
    
    init(value: Double) {
        self.value = value
        print("Created")
    }
    
    subscript(index: Int) -> Double {
        switch index {
        case 1: return value
        case 2: return dualValue
        case 3: return trioValue
        default: return value
        }
    }
    
    var descriptionOfObject: String {
        "Description of this value - \(value):\n dualValue - \(dualValue),\n trioValue - \(trioValue),\n reversedValue - \(reversedValue)"
    }
    var convertInDecimal: String {
        "The decimal representation of value \(value) - \(convertValueInDecimal)"
    }
    
    lazy var dualValue = value * 2
    lazy var trioValue = value * 3
    lazy var reversedValue = value - dualValue

    var convertValueInDecimal: Int {
        Int(value)
    }
    
}

extension Fraction {
    func increment() -> Double {
        return(value + value)
    }
    func decrement() ->Double {
        return(value - value)
    }
    func multi() -> Double {
        return(value * value)
    }
    func split() -> Double {
        return(value / value)
    }
}

var valueOfFraction = Fraction(value: 2.5)
print(valueOfFraction.self.descriptionOfObject)

infix operator ~~ :MultiplicationPrecedence

func ~~(lhs: Double, rhs: Double) -> Double {
    return lhs * lhs + rhs * rhs
}

valueOfFraction.value ~~ valueOfFraction.dualValue

//let num1 = Fraction(value: 0.25)
//let num2 = Fraction(value: 0.25, denominator: 12, numerator: 33)
//let result = num1 + num2 * num1 ~~ num2



