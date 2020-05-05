import UIKit
import Darwin

enum FigureType: Int {
   
   case unknown = 0
   case line = 2
   case triangle = 3
   case square = 4
   case something
}

class Figure {
   private (set) var name: String
   private (set) var points: Int
   private (set) var type: FigureType
   
   init(name: String, points: Int) {
      
      let figurePointCount = points
      
      switch figurePointCount {
         case 0:
            type = .unknown
         case 2:
            type = .line
         case 3:
            type = .triangle
         case 4:
            type = .square
         default:
            type = .something
      }
      
      self.name = name
      self.points = points
   }
   
}

extension Figure {
   
   func perimeterAndArea(_ figure: Figure) -> Double {
      
      switch figure.type {
         case .unknown:
            print("The perimeter and area is unknown")
         case .line:
            print("The perimeter and area is unknown")
         case .triangle:
            print("""
            Perimeter of triangle is sum of A + B + C sides and area is
            lenght of A side multiplies on a height which falls on A side,
            and divided on 2.
            """)
         case .square:
            print("Perimeter of quad is a sum of 2A + 2B sides and area is A side multiplies on B side")
         case .something:
            print("something you need to know")
      }
      return 0
   }
}

class Line: Figure {
   var startPoint: Int = 0
   var endPoint: Int = 0
   
   init(startPoint: Int, endPoint: Int, name: String, points: Int) {
      
      self.startPoint = startPoint
      self.endPoint = endPoint
      
      super.init(name: name, points: points)
   }
   
}

extension Line {
   
   func distance() -> Int {
      let result = startPoint - endPoint
      return result
   }
}

class Vector: Line {
   
   var aX: Double = 0.0
   var aY: Double = 0.0
   var bX: Double = 0.0
   var bY: Double = 0.0
   
   func moduleOfVectors() -> Double {
      
      let endCoordinateX = bX - aX
      let endCoordinateY = bY - aY
      
      let module = sqrt((endCoordinateX * endCoordinateX) + (endCoordinateY * endCoordinateY))
      return module
   }
   
   init(aX: Double, aY: Double, bX: Double, bY: Double) {
      self.aX = aX
      self.aY = aY
      self.bX = bX
      self.bY = bY
      
      super.init(startPoint: 2, endPoint: 3, name: "vector", points: 2)
   }
}

var tree = Vector(aX: 2.0, aY: 2.1, bX: 2.3, bY: 2.3)
tree.moduleOfVectors()

extension Vector {
   func scalar() -> Double {
      let scalars = aX * bX + aY * bY
      return scalars
   }
}
tree.scalar()

extension Vector {
   func angleOfVectors() -> Int {
      return Int(self.scalar() / self.moduleOfVectors())
   }
}

tree.angleOfVectors()

class Triangle {
   
   var aAngle: Int = 0
   var bAngle: Int = 0
   var cAngle: Int = 0
   
   init?(aAngle: Int, bAngle: Int, cAngle: Int){
      let sumOfAngles = aAngle + bAngle + cAngle
      if sumOfAngles != 180 {
         return nil
      }
   }
}
let awe = Triangle(aAngle: 60, bAngle: 40, cAngle: 80)

enum TriangleType {
   
   case angleType(String, String, String)
   case lengthOfSides(String, String, String)
}

//switch TriangleType {
//   case .angleType :
//
//   default:
//
//}

class Square {
   var angleOfASide: Int = 0
   var angleOfBSide: Int = 0
   var angleOfCSide: Int = 0
   var angleOfDSide: Int = 0
   
   init?(angleOfASide: Int, angleOfBSide: Int, angleOfCSide: Int, angleOfDSide: Int) {
      let sumOfAngles = angleOfASide + angleOfBSide + angleOfCSide + angleOfDSide
      if sumOfAngles != 360 {
         return nil
      }
   }
   
}

enum SquareType {
   
   case square
   case rhomb
   case rectangle
}


