import UIKit
import Darwin

enum CoordinateSystemType {
   
   case cartesian
   case polar
   case custom
}

struct Point {
   
   private (set) var x = 0
   private (set) var y = 0
   private (set) var radius = 0.0
   private (set) var angle = 0.0
   
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
      self.radius = sqrt(Double(inputX * inputX + inputY * inputY))
      self.angle = atan(Double(inputY / inputX))
   }
   
   mutating func changingPolar(inputRadius: Double, inputAngle : Double) {
      self.radius = inputRadius
      self.angle = inputAngle
      self.x = Int(inputRadius * cos(inputAngle))
      self.y = Int(inputRadius * sin(inputAngle))
   }
   
   mutating func movePoint(XValue: Int, YValue: Int) {
      radius = sqrt(Double(XValue * XValue + YValue * YValue))
      angle = atan(Double(YValue / XValue))
      x = XValue
      y = YValue
   }
   
   func toString111(convertToString: CoordinateSystemType) -> String {
      
      switch convertToString {
         case .cartesian:
            return "Point in cartesian coordinate system (x: \(x), y: \(y))"
         case .polar:
         "Point in polar coordinate system (radius: \(radius), angle: \(angle))"
         case .custom:
            return "Unknown"
      }
      return "There is a Point"
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


extension Point {
   static  func distance(between startPoint: Point, and endPoint: Point ) -> Int {
      
      let result = 0
      return result
   }
}

var point1 = Point(x: 1, y: 2)
var point2 = Point(x: 3, y: 7)

extension Point {
   
   init(cartesian: CartesianPoint) {
      Point(x: cartesian.x, y: cartesian.y)
   }
   
   init(polar: PolarPoint) {
      Point(radius: polar.radius, angle: polar.angle)
   }
}

extension Point {
   
   static func checkingCartesianPoint(from point: CartesianPoint) -> Point {
      .init(cartesian: point)
   }
   
   static func checkingPolarPoint(from point: PolarPoint) -> Point {
      .init(polar: point)
   }
   
   static func creatingCartesianPoint(from point: CartesianPoint) -> Point {
      
      var cartesianPoint = Point(x: 0, y: 0)
      cartesianPoint.movePoint(XValue: cartesianPoint.x, YValue: cartesianPoint.y)
      return cartesianPoint
   }
   
   static func creatingPolarPoint(from point: PolarPoint) -> Point {
      .init(polar: point)
   }
   
}


// Task 2

enum FigureType: Int {
   
   case unknown = 0
   case point = 1
   case line = 2
   case triangle = 3
   case quad = 4
   case something
}

extension Figure {
   
   static func perimeter(_ figure: Figure) -> Double {
      
      switch figure.type {
         case .unknown:
            print("unknown perimeter")
         case .point:
            print("unknown perimeter")
         case .line:
            print("unknown perimeter")
         case .triangle:
            print("Perimeter of triangle is sum of a + b + c sides.")
         case .quad:
            print("Perimeter of quad is a sum of + b + c + d sides.")
         case .something:
            print("something you need to know")
      }
      return 0
   }
   
}

struct Figure {
   
   private (set) var points: [Point]
   private (set) var type: FigureType
   
   init(points: [Point]) {
      
      let figurePointCount = points.count
      
      switch figurePointCount {
         case 0:
            type = .unknown
         case 1:
            type = .point
         case 2:
            type = .line
         case 3:
            type = .triangle
         case 4:
            type = .quad
         default:
            type = .something
      }
      
      self.points = points
   }
   subscript(_ index: Int) -> Point? {
      if index < points.count, index >= 0 {
         return points[index]
      }
      return nil
   }
}

let figure = Figure(points: [])

figure.perimeter


extension Figure {
   
   var perimeter: Double {
      return Figure.perimeter(self)
   }
}
