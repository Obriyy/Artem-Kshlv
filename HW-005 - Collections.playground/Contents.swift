import UIKit

//Task 1

let fibonacciArray = sequence(first: (0, 1), next: { ($1, $0 + $1) })
.prefix(11).map{$0.0}


let reverseArray = fibonacciArray.reversed().map { $0 }
let reverseArray1 = fibonacciArray.sorted(by: >)
let reverseArray2 = fibonacciArray.sorted { $0 > $1 }
print("Reversed array\(reverseArray)")

let shuffledArray = fibonacciArray.shuffled()
print("Shuffled array \(shuffledArray)")

var snglArray: [Int] = [1]

for _ in 0...98 {
    snglArray.append(Int(snglArray.last! + 1))
}
print(snglArray.count)

print(snglArray[9])

print(snglArray[14...19])

var repeatedArray: [Int] = []
repeatedArray.append(contentsOf: repeatElement(snglArray[9], count: 10))
print("Repeated array \(repeatedArray)")

var oddArray: Array<Array<Int>> = Array<Array<Int>>.init(arrayLiteral: Array<Int>(arrayLiteral: 1, 3, 5, 7, 9 ))
oddArray[0] += Array<Int>(arrayLiteral: 11)
oddArray.insert(Array<Int>(arrayLiteral: 15, 17, 19), at: 1)
oddArray[0] += Array<Int>(arrayLiteral: 13)
oddArray[0][4...6] = []
print(oddArray.removeLast())
oddArray[0][1...3] = [2, 3, 4]
oddArray[0][2..<3] = []

if oddArray.contains(Array<Int>(arrayLiteral: 3)) {
    print("This number not contains in this array")
}
let str = oddArray.description
print(str)

// Task 2

let chSet = Set<Character>(["a", "b", "c", "d"])

var mChSet = chSet
print(mChSet.count)

mChSet.insert("e")
var srtChSet = mChSet.sorted()

mChSet.remove("e")
mChSet.remove(at: mChSet.firstIndex(of: "d")!)
mChSet.description
mChSet.distance(from: mChSet.startIndex, to: mChSet.firstIndex(of: "a")!)

mChSet.insert("a")
print(mChSet)

let aSet: Set = ["One", "Two", "Three", "1", "2"]
let bSet: Set = ["1", "2", "3", "One", "Two"]
let unionSets = aSet.union(bSet)
let intersetctionSet = aSet.intersection(bSet)
let uniqueASet = aSet.subtracting(bSet)
let uniqueBSet = bSet.subtracting(aSet)
let uniqueInBoth = aSet.symmetricDifference(bSet)
let duoSets = [aSet] + [bSet]


let x = 2...4
let y = 1...6
let xSet = Set(x)
let ySet = Set(y)
let zSet: Set = [3, 4, 2]
let x1Set: Set = [5, 6, 7]

let containsInXSet = xSet.isSubset(of: ySet)
let containsInYSet = ySet.isSuperset(of: xSet)
let containsXSet = xSet.isStrictSubset(of: ySet)
let containsYSet = ySet.isStrictSuperset(of: xSet)
let equalSets = xSet == zSet
let xSetSubsetOfZset = xSet.isStrictSubset(of: zSet)
let xSetContainsZset = xSet.isStrictSuperset(of: zSet)


// Task 3

let nDict: [Int: String] = [1 : "numberOne", 2 : "numberTwo", 3 : "numerThree", 4 : "numberFour", 5 : "numberFive"]

print("Value of a key 3 is \(nDict[3]!)")
let index = nDict.index(forKey: 4)
print("Value of a key 4 with index \(nDict[index!].value)")
var mNDict = nDict
mNDict[6] = "Seven"
mNDict[7] = "Six"
mNDict.updateValue("Six", forKey: 6)
mNDict.updateValue("Seven", forKey: 7)
mNDict.updateValue("Eight", forKey: 8)
mNDict.removeValue(forKey: 5)
mNDict.remove(at: mNDict.index(forKey: 4)!)
let distance = mNDict.distance(from: mNDict.index(forKey: 1)!, to: mNDict.index(forKey: 7)!)
print(distance)

let mNDictKeys = Array(mNDict.keys)
let mNDictValues = Array(mNDict.values)
print("Count of elements in Dictionary - \(mNDict.count), keys - \(mNDict.keys.count), and values - \(mNDict.values.count).")
print(mNDict.description)
