import Foundation

// Task 1

class someDoors {

    var conditionNew: Bool
    var colour: String
    var material: String
    
    init(conditionNew: Bool, colour: String, material: String) {
        self.conditionNew = conditionNew
        self.colour = colour
        self.material = material
    }
    
}
var door = someDoors(conditionNew: true, colour: "brown", material: "wood")

let futureDoor = door
door.conditionNew = false
futureDoor.conditionNew

struct Person {
    var name: String
}


var person1: Person = Person.init(name: "Maximilian")
var person2 = person1
person2.name = "Max"


if person1.name != person2.name {
    print("\(person2.name) +  \(person1.name)")
}

// Task 2

class Unowned<T: AnyObject> {
  unowned var value: T
  init (_ value: T) {
    self.value = value
  }
}


class Persona {
    var name: String
    var invite: Son?
    var child: [Unowned<Son>] = []
    
    init(name: String) {
        self.name = name
        print("Person \(name) was initialised")
    }
    deinit {
        print("Deallocating user named: \(name)")
    }
}
    do {
        let par1 = Persona(name: "Robert")
        let par2 = Persona(name: "Richard")
        let chi1 = Son(name: "Max")
        let chi2 = Son(name: "Ronny")
        
        par1.child.append(Unowned(chi1))
        par2.child.append(Unowned(chi2))
        chi1.parent.append(Unowned(par1))
        chi2.parent.append(Unowned(par2))
    }

class Son {
    var name: String
    var accept: Persona?
    var parent: [Unowned<Persona>] = []
    
    init(name: String) {
        self.name = name
        print("Son \(name) was initialised")
    }
    deinit {
        print("Deallocating son named: \(name)")
    }
}

// Task 3

class Operand {
    let number: Int
    var forOpe: Operand?
    var operand: [Unowned<Operand>]? = []
    var description: String?
    lazy var someDesc: () -> String = { [weak self] in
        if let text = self?.description {
        return "\(text)"
        } else {
          return "<\(self?.description ?? "no value") />"
        }
    }
    
    init(number: Int) {
        self.number = number
        print("\(number) is being initialized")
        description = "trying closure as parameter"
    }
    
    deinit {
        print("\(number) has being deinitialized")
    }
}

func operation(op1: Int, op2: Int, resultOperation: (Int, Int) -> Int) -> Int {
    return resultOperation(op1, op2)
}
let result = operation(op1: 1, op2: 2, resultOperation: {(op1: Int, op2: Int) -> Int in
    return op1 + op2
})
print(result)

do {
    let op1 = Operand(number: 1)
    let op2 = Operand(number: 2)

    op1.operand?.append(Unowned(op2))
    op2.operand?.append(Unowned(op1))
    
}

var oneOfOperand: Operand? = Operand(number: 222)
print(oneOfOperand!.someDesc())

oneOfOperand = nil
