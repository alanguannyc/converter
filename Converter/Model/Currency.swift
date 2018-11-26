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
    static var baseURL = "https://forex.1forge.com/1.0.3/quotes?"
    
    enum CurrencyUnit : String, CaseIterable{
        case AED = "UAE Dirham"
        case ALL = "Albanian Lek"
        case DZD = "Algerian Dinar"
        case ARS = "Argentine Peso"
        
        var currencyIdentifier: String {
            switch self {
            case .AED:
                return "USD"
            case .ALL:
                return "ALL"
            case .DZD:
                return "DZD"
            case .ARS:
                return "ARS"
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


