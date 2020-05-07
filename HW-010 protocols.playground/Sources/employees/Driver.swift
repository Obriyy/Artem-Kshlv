import Foundation

public final class Driver: CorporateEthics {
   
   public func doTasks() {
      print("I'm \(name) and i'm doing tasks of my chief.")
   }
   
   // variables
   public var name: String
   public var surname: String
   public var salary: Int
   public var dateOfBirth: String
   public var dateOfEmployment: String
   public var gender: String
   public var hobby: String
   
   //basic funcs
   public func sayHello() { print("Hello, my name \(name)") }
   public func complain() { print("Сomplain about") }
   public func drinkACupOfCoffee() { print("drink some coffee") }
   public func sleep() { print("need sleep") }
   public func eat() { print("need eat") }
   public func getSalary() { print("yeahh my money") }
   
   // inits
   
   public init(name: String, surname: String, salary: Int, dateOfBirth: String,
               dateOfEmployment: String, gender: String, hobby: String) {
      self.name = name
      self.surname = surname
      self.salary = salary
      self.dateOfBirth = dateOfBirth
      self.dateOfEmployment = dateOfEmployment
      self.gender = gender
      self.hobby = hobby
   }
   
}
