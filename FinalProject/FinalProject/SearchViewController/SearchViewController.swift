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
    
    static var array = [Any]()
    let responseObject = DataResponse()
    
    public func urlCreation(path: HTTPCall) -> URL {
        let api = "https://hryvna-today.p.rapidapi.com"
        let endpoint = "\(path.rawValue)"
        
        guard let url = URL(string: api + endpoint) else {return URL(string: "")!}
        
        return url
    }
    
    public func createRequest(httpRequest: HTTPCall) {
        
        let headers = Constants.headers
                
        let request = NSMutableURLRequest(url: urlCreation(path: httpRequest),
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
            } else {
                guard let data = data else {return}
                let jsonObject = Data.jsonFromData(data)
                guard let json = jsonObject else {return}
                if let dataArray = json["data"] as? [[String: Any]] {
                    switch httpRequest {
                        case .landing:
                            self.responseObject.landing(dataArray)
                        //                    case .bankRates:
                        //
                        //                    case .averageRates:
                        //
                        //                    case .todayRates:
                        //
                        //                    case .currencyList:
                        //
                        //                    case .bankTypesList:
                        //
                        case .bankList:
                            self.responseObject.bankList(dataArray)
                        //                    case .convertRates:
                        //
                        default:
                            break
                    }
                } else {
                    print("error...................")
                }

                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {return}
                guard let mime = response?.mimeType, mime == "application/json" else {
                    print("Wrong Mime type!")
                    return
                }
                print(httpResponse.statusCode)
                print(SearchViewController.array)
                
                DispatchQueue.main.async {
                    self.searchResultTableView.reloadData()
                }
            }
        })
        dataTask.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.createRequest(httpRequest: .bankList)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SearchViewController.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultTableViewCell", for: indexPath)
        guard let array = SearchViewController.array as? [BankModel] else {return UITableViewCell()}
        cell.textLabel?.text = "\(array[indexPath.row].title)"
//        cell.detailTextLabel?.text = array.title
        //dataSource[indexPath.row]
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
