
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
   
   private var myView = UIView(frame: CGRect(x: 10, y: 10, width: 350, height: 150))
   private var x: CGFloat = 0
   private var y: CGFloat = 0
   private var label = UILabel()
   private var button = UIButton()
   private var mooving: Bool = false
   
   override func loadView() {
      let view = UIView()
      view.backgroundColor = .systemTeal
      
      let label = UILabel()
      label.frame = CGRect(x: 145, y: 550, width: 200, height: 20)
      label.textColor = .white
      label.numberOfLines = 4
      label.font.withSize(10)
      
      let button = UIButton()
      button.backgroundColor = .systemIndigo
      button.frame = CGRect(x: 135, y: 500, width: 100, height: 30)
//      button.addTarget(self, action: #selector(method), for: .touchUpInside)
      
      view.addSubview(label)
      view.addSubview(button)
      self.view = view
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      view.addSubview(myView)
      label.frame = CGRect(x: 0, y: 0, width: myView.frame.width, height: myView.frame.height)
      myView.backgroundColor = .blue
      myView.addSubview(label)
   }
   
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      if let touch = event?.allTouches?.first {
         let location = touch.location(in: view)
         
         mooving = true
         x = location.x
         y = location.y
      }
   }
   
   override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
      if let touch = event?.allTouches?.first {
         let location = touch.location(in: view)
         
         if mooving {
            myView.frame.origin.x = myView.frame.origin.x + (location.x - x)
            myView.frame.origin.y = myView.frame.origin.y + (location.y - y)
            
            x = location.x
            y = location.y
            
            label.text = "x = \(myView.frame.origin.x), y = \(myView.frame.origin.y), wigth = \(myView.frame.width), heigh = \(myView.frame.height)"
         }
      }
   }
   
   override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
      mooving = false
   }
   
}

PlaygroundPage.current.liveView = MyViewController()
