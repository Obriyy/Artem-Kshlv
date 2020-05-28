//: [Previous](@previous)

import UIKit
import PlaygroundSupport

final class MySecondView: UIView {
   
   override func draw(_ rect: CGRect) {
      
      guard let context = UIGraphicsGetCurrentContext() else {
         return
      }
      let colorSpace = CGColorSpaceCreateDeviceRGB()
      context.saveGState()
      let gradientColors = [
         UIColor.blue,
         UIColor.yellow,
         UIColor.green
         ].compactMap({ $0.cgColor })
      let locations: [CGFloat] = [ 0.0, 0.5, 0.75 ]
      
      if let gradient = CGGradient(colorsSpace: colorSpace, colors: gradientColors as CFArray, locations: locations) {
         let startPoint = CGPoint(x: rect.size.height / 2, y: 0)
         let endPoint = CGPoint(x: rect.size.height / 2, y: rect.size.width)
         context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: [])
      }
      context.restoreGState()
      
      context.saveGState()
      
      let rectangle = CGRect(x: 20, y: 0, width: 280, height: 250)
      context.setFillColor(UIColor.orange.cgColor)
      context.setStrokeColor(UIColor.blue.cgColor)
      context.setLineWidth(2)
      
      context.addRect(rectangle)
      context.drawPath(using: .fillStroke)
      context.restoreGState()

   }
}

PlaygroundPage.current.liveView = MySecondView()
