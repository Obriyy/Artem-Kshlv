//
//  DataResponse.swift
//  FinalProject
//
//  Created by Artem Kosheliev on 08/26/2021.
//  Copyright © 2021 kosheliev. All rights reserved.
//

import Foundation

struct DataResponse {
    
    func landing(_ dataArray: [[String : Any]]) {
        for data in dataArray {
            let avg = data["avg"] as? String ?? ""
            let days = data["days"] as? String ?? ""
            let banks = data["banks"] as? String ?? ""

            let object = LandingModel(avg: avg, days: days, banks: banks)
            
            DispatchQueue.main.async {
                SearchViewController.array.append(object)
            }
        }
    }
    
    func bankList(_ dataArray: [[String : Any]]) {
        for data in dataArray {
            let id = data["id"] as? Int ?? NSNotFound
            let rate = data["rate"] as? Int ?? NSNotFound
            let title = data["title"] as? String ?? ""
            let type_id = data["type_id"] as? Int ?? NSNotFound
            
            let object = BankModel(id: id, rate: rate, title: title, type_id: type_id)
            
            DispatchQueue.main.async {
                SearchViewController.array.append(object)
            }
        }
    }
}
