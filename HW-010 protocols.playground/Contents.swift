import Foundation

public final class Сorporation {
   
   let chief = Chief.self
   var employees = employeesOfCorp
   
   func hire(_ newEmployee: CorporateEthics) {
      employees.append(newEmployee)
   }
   
   func dismiss() {
      // dismiss from the team
   }
   
   func changingSalary() {
      // changing salary
      }
   
   func searchingWorkers() {
      // searching for new workers
   }
   
}

let workerEddy: CorporateEthics = Teacher(name: "Eddy", surname: "Lisbo", salary: 3000, dateOfBirth: "11.05.1990", dateOfEmployment: "10.04.1990", gender: "female", hobby: "gardening")
let workerMarta: CorporateEthics = Driver(name: "Marta", surname: "Treliane", salary: 3400, dateOfBirth: "01.06.1987", dateOfEmployment: "01.03.2020", gender: "male", hobby: "singing")

workerEddy.sayHello()

let chief = Chief(delegate: workerEddy)
workerEddy.doTasks()
chief.delegate = workerMarta
workerMarta.doTasks()
workerEddy.name


//public final class Dates: DateFormatter {
//}

//extension Сorporation:  {
//   func
//}
