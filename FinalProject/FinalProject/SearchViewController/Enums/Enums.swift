//
//  Enums.swift
//  FinalProject
//
//  Created by Artem Kosheliev on 08/19/2021.
//  Copyright © 2021 Artem Kosheliev. All rights reserved.
//

import Foundation

public enum AliasType: Int, CaseIterable, Codable {
    case avg = 0
    case goverment = 1
    case commercial = 2
    case interbank = 3
    case black = 4
}

public enum AliasTypeTitle: String, CaseIterable, Codable {
    case national = "НБУ"
    case comerc = "Банки"
    case interb = "Міжбанк"
    case changers = "Міняйли"
}

public enum BankList: String, CaseIterable, Codable {
    case National = "Національний банк України"
    case Raifaizen = "Райффайзен Банк Аваль"
    case PrivatBank = "ПриватБанк"
    case CreditDnipro = "Кредит Дніпро"
    case FrugalBank = "Ощадбанк"
    case CrediAgricole = "Креді Агріколь Банк"
    case UkrSibBank = "УкрСиббанк"
    case Kredobank = "Кредобанк"
    case UkrEximBank = "Укрексімбанк"
    case OTPBank = "ОТП Банк"
    case IdeaBank = "Ідея Банк"
    case ProCreditBank = "ПроКредит Банк"
    case Pumb = "ПУМБ"
    case BankPivdenny = "Банк Південний"
    case BlackMarket = "Чорний ринок"
    case InterBank = "Міжбанк"
}

public enum Operation: String, CaseIterable, Codable {
    case avg, buy, sale
}

public enum CurrencyId: Int, CaseIterable, Codable {
    case id124 = 124
    case id392 = 392
    case id643 = 643
    case id756 = 756
    case id826 = 826
    case id840 = 840
    case id978 = 978
    case id980 = 980
    case id985 = 985
}

public enum CurrencyCode: String, CaseIterable, Codable {
    case cad = "CAD"
    case jpy = "JPY"
    case rub = "RUB"
    case chf = "CHF"
    case gbp = "GBP"
    case usd = "USD"
    case eur = "EUR"
    case uah = "UAH"
    case pln = "PLN"
}

public enum CurrencyTitle: String, CaseIterable, Codable {
    case cd = "Канадський долар"
    case jp = "Японська єна"
    case ru = "Російський рубль"
    case ch = "Швейцарський франк"
    case en = "Англійський фунт стерлінгів"
    case us = "Долар США"
    case eu = "Євро"
    case ua = "Гривня"
    case pl = "Польський злотий"
}

public enum CurrencyVerbal: String, CaseIterable, Codable {
    case canadian = "канадійський долар"
    case japanese = "єна"
    case ruble = "рубль"
    case switzerland = "франк"
    case english = "фунт"
    case unitedStates = "долар"
    case europeanUnion = "євро"
    case ukrainian = "гривня"
    case polish = "злотий"
}

public enum CurrencySymbol: String, CaseIterable, Codable {
    case can = "C$"
    case jap = "¥"
    case rus = "₽"
    case swt = "₣"
    case eng = "£"
    case usa = "$"
    case eu = "€"
    case ukr = "₴"
    case pol = "zł"
    
}

