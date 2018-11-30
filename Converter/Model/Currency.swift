//
//  LengthModel.swift
//  Converter
//
//  Created by Alan on 10/26/18.
//  Copyright © 2018 AlanG. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire


struct Currency {
    
    var unit : CurrencyUnit?
    var unitValue : Double?
    
    static var baseUnit = "USD"
    static var API_KEY = "cYsl7UrbIyEXnJrykVueciRMz1IJHAko"
//    static var baseURL = "https://forex.1forge.com/1.0.3/convert?"
    static var baseURL = "https://api.exchangeratesapi.io/latest"
    
    enum CurrencyUnit : String, CaseIterable{
        case BGN = "Bulgarian Lev"
        case CAD = "Canadian Dollar"
        case BRL = "Brazilian Real"
        case HUF = "Forint"
        case DKK = "Danish Krone"
        case JPY = "Yen"
        case ILS = "New Israeli Shekel"
        case TRY = "Turkish Lira"
        case RON = "Leu"
        case GBP = "Pound Sterling"
        case PHP = "Philippine Peso"
        case HRK = "Croatian Kuna"
        case NOK = "Norwegian Krone"
        case USD = "US Dollar"
        case MXN = "Mexican Peso"
        case AUD = "Australian Dollar"
        case IDR = "Rupiah"
        case KRW = "South Korean Won"
        case HKD = "Hong Kong Dollar"
        case ZAR = "Rand"
        case ISK = "Iceland Krona"
        case CZK = "Czech Koruna"
        case THB = "Baht"
        case MYR = "Malaysian Ringgit"
        case NZD = "New Zealand Dollar"
        case PLN = "PZloty"
        case SEK = "Swedish Krona"
        case RUB = "Russian Ruble"
        case CNY = "Yuan"
        case SGD = "Singapore Dollar"
        case CHF = "Swiss Franc"
        case INR = "Indian Rupee"
       
        
        var currencyIdentifier: String {
            switch self {
            case .BGN: return "BGN"
            case .CAD: return "CAD"
            case .BRL: return "BRL"
            case .HUF: return "HUF"
            case .DKK: return "DKK"
            case .JPY: return "JPY"
            case .ILS: return "ILS"
            case .TRY: return "TRY"
            case .RON: return "RON"
            case .GBP: return "GBP"
            case .PHP: return "PHP"
            case .HRK: return "HRK"
            case .NOK: return "NOK"
            case .USD: return "USD"
            case .MXN: return "MXN"
            case .AUD: return "AUD"
            case .IDR: return "IDR"
            case .KRW: return "KRW"
            case .HKD: return "HKD"
            case .ZAR: return "ZAR"
            case .ISK: return "ISK"
            case .CZK: return "CZK"
            case .THB: return "THB"
            case .MYR: return "MYR"
            case .NZD: return "NZD"
            case .PLN: return "PLN"
            case .SEK: return "SEK"
            case .RUB: return "RUB"
            case .CNY: return "CNY"
            case .SGD: return "SGD"
            case .CHF: return "CHF"
            case .INR: return "INR"
            }
        }
    }
    
}

// MARK: - Set base value
func updateCurrency(URL: String = Currency.baseURL, from: String, to: String, quantity: Double, cell : UnitTableViewCell) {
    
    let baseParams: Parameters = [
        "from": from,
        "to" : to,
        "quantity" : quantity,
        "api_key" : Currency.API_KEY
    ]
    
    
    Alamofire.request(URL, method: .get, parameters: baseParams, encoding: URLEncoding(destination: .queryString)).responseJSON { (response) in
        switch response.result {
        case .success(let value):
            let convertedValue = JSON(value)["value"].double
            print(convertedValue)
            cell.NumberLabel.text = String(convertedValue!)
        case .failure(let error):
            print(error)
        }
    }
}


