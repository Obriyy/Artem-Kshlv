//
//  Constants.swift
//  FinalProject
//
//  Created by Artem Kosheliev on 08/20/2021.
//  Copyright © 2021 kosheliev. All rights reserved.
//

import Foundation

public class Constants {
    
    public static let landing = "https://hryvna-today.p.rapidapi.com/v1/rates/landing"
    public static let BankRates = "https://hryvna-today.p.rapidapi.com/v1/rates/banks"
    public static let averageRates = "https://hryvna-today.p.rapidapi.com/v1/rates/averages"
    public static let todayRates = "https://hryvna-today.p.rapidapi.com/v1/rates/today"
    public static let convertRates = "https://hryvna-today.p.rapidapi.com/v1/convert?to=980&sum=100&from=840&type=commercial"
    public static let currencyList = "https://hryvna-today.p.rapidapi.com/v1/list/currencies"
    public static let bankTypesList = "https://hryvna-today.p.rapidapi.com/v1/list/bank_types"
    public static let bankList = "https://hryvna-today.p.rapidapi.com/v1/list/banks"
    
    public static let headers = [
        "x-rapidapi-host": "hryvna-today.p.rapidapi.com",
        "x-rapidapi-key": "ca92318762mshb7cf2a04e11b2e6p188c36jsn3e8ab6f18cd1"
    ]
    
}
