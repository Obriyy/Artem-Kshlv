//
//  SearchViewController.swift
//  FinalProject
//
//  Created by PRPL on 06.07.2020.
//  Copyright © 2020 kosheliev. All rights reserved.
//

import UIKit

final class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   @IBOutlet weak var SearchView: UIView!
   @IBOutlet private weak var searchResultTableView: UITableView!
   
   
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return dataSource.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultTableViewCell", for: indexPath)
      cell.textLabel?.text = dataSource[indexPath.row]
      return cell
   }
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      tableView.deselectRow(at: indexPath, animated: true)
      
      performSegue(withIdentifier: "SearchResultTableViewCell", sender: indexPath)
   }
   
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return tableView == searchResultTableView ? 180 : 40
   }

   private (set) var dataSource: [String] = [
      "OTP Bank",
      "PrivatBank",
      "Raiffeisen Bank Aval",
      "Alfa Bank",
      "Credit Agricole"
   ]
   
   
    override func viewDidLoad() {
        super.viewDidLoad()

        print(TableViewController.createRequest())
   }
   
}
//      var values:[GitObject] = []
//
//      let urlSession = URLSession.shared
//      let url = URL(string: "http://resources.finance.ua/ua/public/currency-cash.json")
//      let request = URLRequest(url: url!)
//      let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
//         let jsonObj = Data.jsonFromData(data!)
//
//         if let jsonDict = jsonObj {
//            if let organizations = jsonDict["organizations"] as? [[String:AnyObject]] {
//               items.forEach({ (rawValue) in
//                  if let objectToReturn = GitObject(data: rawValue) {
//                     values.append(objectToReturn)
//                  }
//               })
//
//            }
//         }
//
//         print(values)
//      }
//      dataTask.resume()
//
//   }

//extension Data {
//   var stringValue : String {
//      get {
//         let retval = String(data: self, encoding: String.Encoding.utf8)
//         if let _ = retval {
//            return retval!
//         } else {
//            return ""
//         }
//      }
//   }
//
//   static func jsonDataFromDictionary(_ dictionary:[String : AnyObject]) -> Data?  {
//      do {
//         let obj = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
//         return obj
//      } catch {
//         return nil
//      }
//   }
//
//   static func jsonDataFromObj(_ inputObj:AnyObject) -> Data?  {
//      do {
//         let obj = try JSONSerialization.data(withJSONObject: inputObj, options: .prettyPrinted)
//         return obj
//      } catch {
//         return nil
//      }
//   }
//
//   static func jsonFromData(_ receivedData:Data?) -> [String:AnyObject]? {
//      if let value = receivedData,
//         let newStr = String(data: value, encoding: .utf8),
//         let data = newStr.data(using: .utf8) {
//
//         do {
//            let obj = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments)
//            if let serializedObject = obj as? [String:AnyObject] {
//               return serializedObject
//            }
//         } catch  { }
//      }
//      return nil
//   }
//
//}
//
//   final class GitObject {
//      var objectId:Int
//      var repoFullName:String?
//      var avatarURL:String?
//      var repoLink:String?
//      var repoDescription:String?
//      var stars:Int?
//      #if DEBUGMODE
//      var watchers:Int? // old way to get stars, according to doc - just for check
//      #endif
//
//      // MARK: - LifeCycle
//
//      init?(data:[String:AnyObject]) {
//         if let objId = data["id"] as? Int {
//            objectId = objId
//            repoFullName = data["name"] as? String
//            if let owner = data["owner"] as? [String:AnyObject] {
//               avatarURL = owner["avatar_url"] as? String
//            }
//            repoLink = data["html_url"] as? String
//            repoDescription = data["description"] as? String
//            stars = data["stargazers_count"] as? Int
//            #if DEBUGMODE
//            watchers = data["watchers_count"] as? Int
//            if watchers != stars {
//               print("difference in new api detected")
//            }
//            #endif
//         } else {
//            return nil
//         }
//      }
//}
