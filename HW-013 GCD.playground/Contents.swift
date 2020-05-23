import UIKit
import PlaygroundSupport

enum ErrorOfArray: Error {
   
   case unknown
   case arrayIsFilled
   
}

class Emoji {
   enum Constants {
      static let emojiCount = 125
   }
   private var emojiArray = [Character]()
   
   private let serialQueue = DispatchQueue(label: "com.serial")
   private let concurentEmojiQueue = DispatchQueue(label: "com.concurrent.emoji", qos: .userInteractive, attributes: .concurrent)
   
   private let progress = Progress(totalUnitCount: Int64(Constants.emojiCount))
   private let semaphore = DispatchSemaphore(value: 1)
   private let group = DispatchGroup()
   
   private func createTask() -> DispatchWorkItem {
      DispatchWorkItem { [weak self] in
         if let self = self {
            if self.emojiArray.count < 125 {
               self.emojiArray.append("🦋")
               
               self.progress.completedUnitCount = Int64(self.emojiArray.count)
               print(String(format: "progress - %.1f %%", self.progress.fractionCompleted * 100))
               
               if self.emojiArray.count % 15 == 0 {
                  sleep(3)
               }
               
               self.semaphore.signal()
               self.group.leave()
               
            }
         }
      }
   }
   
   
   func executeTask() {
      
      group.notify(queue: .main) {
         self.emojiArray.forEach({ print($0) })
      }
      
      concurentEmojiQueue.async {
         while self.emojiArray.count < 125 {
            self.semaphore.wait()
            self.group.enter()
            self.createTask().perform()
         }
      }
   }
}

let testEmojiObj = Emoji()
testEmojiObj.executeTask()
print(testEmojiObj)



