//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

final class Circle: UIView {
   override func draw(_ rect: CGRect)
   {
      let context = UIGraphicsGetCurrentContext()
      context?.setLineWidth(20)
      context?.setStrokeColor(UIColor.red.cgColor)
      let rectangle = CGRect(x: 100, y: 200,width: 200,height: 200)
      context?.addEllipse(in: rectangle)
      context?.strokePath()
      
      let context1 = UIGraphicsGetCurrentContext()
      context1?.setLineWidth(20)
      context1?.setStrokeColor(UIColor.blue.cgColor)
      let rectangle1 = CGRect(x: rectangle.origin.x * 1.5, y: rectangle.origin.y * 1.25, width: rectangle.width / 2, height: rectangle.height / 2)
      context1?.addEllipse(in: rectangle1)
      context1?.strokePath()
      
      let context2 = UIGraphicsGetCurrentContext()
      context2?.setLineWidth(20)
      context2?.setStrokeColor(UIColor.red.cgColor)
      let rectangle2 = CGRect(x: rectangle.origin.x * 1.9, y: rectangle.origin.y * 1.45, width: rectangle1.width / 5, height: rectangle1.height / 5)
      context2?.addEllipse(in: rectangle2)
      context2?.strokePath()
   }
}

final class SomeViewController: UIViewController {
   override func loadView() {
      let view = Circle()
      view.backgroundColor = .black
      
      self.view = view
   }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = SomeViewController()
