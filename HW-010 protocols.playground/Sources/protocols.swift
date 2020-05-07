import Foundation

public protocol EveryEmployeeMustHave {
   
   var name: String { get }
   
   var surname: String { get }
   
   var salary: Int { get }
   
   var dateOfBirth: String { get }
   
   var dateOfEmployment: String { get }
   
   var gender: String { get }
   
   var hobby: String { get }
   
}

public protocol HaveToDo {
   func sayHello()
   
   func complain()
   
   func drinkACupOfCoffee()
   
   func sleep()
   
   func eat()
   
   func getSalary()
}

public protocol CorporateEthics: EveryEmployeeMustHave, HaveToDo, Delegate { }

public protocol Delegate: class {
   
   func doTasks()
}
