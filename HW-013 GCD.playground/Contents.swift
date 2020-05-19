import UIKit
import PlaygroundSupport

enum ErrorOfArray: Error {
   
   case unknown
   case arrayIsFilled
   
}

private (set) var emojiArray = [Character]()

let serialQueue = DispatchQueue(label: "com.serial")
let queue = DispatchQueue(label: "com.concurrent", qos: .userInteractive, attributes: .concurrent)
let queue1 = DispatchQueue(label: "com.concurrent1", qos: .userInitiated, attributes: .concurrent)

var emoji: Character = " "
var emoji1: Character = " "

func task(_: Character) {
   for _ in emojiArray.count..<125 {
      emojiArray.append(emoji)
      
      print("\(emoji) on \(emojiArray.count), with value \(qos_class_self().rawValue)")
   }
}

private (set) var workItem: DispatchWorkItem = DispatchWorkItem {
   serialQueue.sync {
      if emojiArray.count != 125 {
         queue.async {
            for _ in emojiArray.count..<125 {
               emojiArray.append(emoji)
            }
         }
         queue1.async {
            for _ in emojiArray.count..<125 {
               emojiArray.append(emoji1)
            }
         }
      } else {
         "You can't add it"
      }
      
   }
}

workItem.notify(queue: serialQueue)  {
   if emojiArray.count == 125 {
      print("Reached the limit")
   }
}

DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(4)) {
   workItem.cancel()
   print("cancelled")
}
emoji = "🦋"
emoji1 = "🧞‍♀️"
queue.async(execute: workItem)
queue1.async(execute: workItem)


print(emojiArray.count)




