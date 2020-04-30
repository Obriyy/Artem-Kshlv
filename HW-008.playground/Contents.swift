import UIKit
import Darwin


struct Point {
   
   private (set) var x = 1
   private (set) var y = 1
   private (set) var radius = 1.41
   private (set) var angle = 0.79
   
   init(x: Int, y: Int) {
      self.x = x
      self.y = y
      self.radius = sqrt(Double(x * x + y * y))
      self.angle = atan(Double(y / x))
   }
   
   init(radius: Double, angle: Double) {
      self.radius = radius
      self.angle = angle
      self.x = Int(radius * cos(angle))
      self.y = Int(radius * sin(angle))
   }
   
   mutating func changingCartesian(inputX: Int, inputY: Int) {
      self.x = inputX
      self.y = inputY
   }
   
   mutating func changingPolar(inputRadius: Double, inputAngle : Double) {
      self.radius = inputRadius
      self.angle = inputAngle
   }
   
   func toString(cartesian: Bool) -> String {
      if cartesian {
         print("Point in cartesian coordinate system (x: \(x), y: \(y))")
      }
      return "Point in polar coordinate system (radius: \(radius), angle: \(angle))"
   }
   
}

struct CartesianPoint {
   
   var x: Int
   var y: Int
   
   init(x: Int, y: Int) {
      self.x = x
      self.y = y
   }
   
}

struct PolarPoint {
   
   var radius: Double
   var angle: Double
   
   init(radius: Double, angle: Double){
      self.radius = radius
      self.angle = angle
   }
   
}

var na = Point(x: 1, y: 1)
na.changingCartesian(inputX: 2, inputY: 3)
print(na.self)
print(na.toString(cartesian: false))



//
//extension Point {
//   func cartesian() -> CartesianPoint {
//
//      return CartesianPoint.init(x: <#T##Int#>, y: <#T##Int#>)
//   }
//
//   func polar() -> PolarPoint {
//
//      return PolarPoint.init(radius: <#T##Double#>, angle: <#T##Double#>)
//   }
//}



