//
//  TableView.swift
//  FinalProject
//
//  Created by PRPL on 06.07.2020.
//  Copyright © 2020 kosheliev. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    let status = HTTPURLResponse()
    let data = Data()
    
    public static func createRequest() {
        
        let headers = [
            "x-rapidapi-host": "hryvna-today.p.rapidapi.com",
            "x-rapidapi-key": "ca92318762mshb7cf2a04e11b2e6p188c36jsn3e8ab6f18cd1"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://hryvna-today.p.rapidapi.com/v1/rates/today")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error!)
            } else {
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {return}
                guard let data = data else {return}
                guard let mime = response?.mimeType, mime == "application/json" else {
                    print("Wrong Mime type!")
                    return
                }
                print(httpResponse)
                print(data)
                if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                    print(json)
                }
            }
        })
        
        dataTask.resume()
    }
}
