//
//  BankModel.swift
//  FinalProject
//
//  Created by Artem Kosheliev on 08/20/2021.
//  Copyright © 2021 kosheliev. All rights reserved.
//

import Foundation

struct BankModel: Codable {
    let id: Int
    let rate: Int
    let title: String
    let type_id: Int
}
