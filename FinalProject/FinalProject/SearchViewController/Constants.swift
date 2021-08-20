//
//  Constants.swift
//  FinalProject
//
//  Created by Artem Kosheliev on 08/20/2021.
//  Copyright © 2021 kosheliev. All rights reserved.
//

import Foundation

struct Constants {
    
    static let headers = [
        "x-rapidapi-host": "hryvna-today.p.rapidapi.com",
        "x-rapidapi-key": "ca92318762mshb7cf2a04e11b2e6p188c36jsn3e8ab6f18cd1"
    ]
    
}

enum HTTPCall: String {
    case landing = "/v1/rates/landing"
    case bankRates = "/v1/rates/banks"
    case averageRates = "/v1/rates/averages"
    case todayRates = "/v1/rates/today"
    case convertRates = "/v1/convert?to=980&sum=100&from=840&type=commercial"
    case currencyList = "/v1/list/currencies"
    case bankTypesList = "/v1/list/bank_types"
    case bankList = "/v1/list/banks"
}
