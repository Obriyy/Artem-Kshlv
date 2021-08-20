//
//  Data+Extensions.swift
//  FinalProject
//
//  Created by Artem Kosheliev on 08/27/2021.
//  Copyright © 2021 kosheliev. All rights reserved.
//

import Foundation

extension Data {
    var stringValue : String {
        get {
            let retval = String(data: self, encoding: String.Encoding.utf8)
            if let _ = retval {
                return retval!
            } else {
                return ""
            }
        }
    }
    
    static func jsonDataFromDictionary(_ dictionary:[String : AnyObject]) -> Data?  {
        do {
            let obj = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
            return obj
        } catch {
            return nil
        }
    }
    
    static func jsonDataFromObj(_ inputObj:AnyObject) -> Data?  {
        do {
            let obj = try JSONSerialization.data(withJSONObject: inputObj, options: .prettyPrinted)
            return obj
        } catch {
            return nil
        }
    }
    
    static func jsonFromData(_ receivedData:Data?) -> [String: Any]? {
        if let value = receivedData,
           let newStr = String(data: value, encoding: .utf8),
           let data = newStr.data(using: .utf8) {
            
            do {
                let obj = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments)
                if let serializedObject = obj as? [String: Any] {
                    return serializedObject
                }
            } catch  { }
        }
        return nil
    }
    
}
