//
//  ResponseModel.swift
//  FinalProject
//
//  Created by Artem Kosheliev on 08/20/2021.
//  Copyright © 2021 kosheliev. All rights reserved.
//

import Foundation

struct ResponseModel: Codable {
    let data: String
    let status: String
}

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
