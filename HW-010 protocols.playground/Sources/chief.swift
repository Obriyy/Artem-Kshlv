import Foundation

public final class Chief {
   
   public weak var delegate: Delegate?
   
   public init(delegate: Delegate?) {
      self.delegate = delegate
   }
   
   func doingTasks() {
      delegate?.doTasks()
   }
}


