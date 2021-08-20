//
//  Enums.swift
//  FinalProject
//
//  Created by Artem Kosheliev on 08/19/2021.
//  Copyright © 2021 Artem Kosheliev. All rights reserved.
//

import Foundation

public final class Enums {
    
    public enum AliasType: String, CaseIterable {
        case avg = "avg"
        case goverment = "НБУ"
        case commercial = "Банки"
        case interbank = "Міжбанк"
        case black = "Міняйли"
    }
    
    public enum BankList: String, CaseIterable {
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
    
    public enum Operation: String, CaseIterable {
        case avg, buy, sale
    }
    
    public enum CurrencyId: Int, CaseIterable {
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
        
    public enum CurrencyCode: String, CaseIterable {
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
    
    public enum CurrencyTitle: String, CaseIterable {
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
    
    public enum CurrencyVerbal: String, CaseIterable {
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
    
    public enum CurrencySymbol: String, CaseIterable {
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
    
}


