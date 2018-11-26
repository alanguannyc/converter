import UIKit
import Alamofire
import SwiftyJSON

class Currency {
    
    var unit : CurrencyUnit?
    var unitValue : Double?
    
    init(unit : CurrencyUnit, unitValue : Double) {
        self.unit = unit
        self.unitValue = unitValue
    }
    
    static var API_KEY = "cYsl7UrbIyEXnJrykVueciRMz1IJHAko"
    static var baseURL = "https://forex.1forge.com/1.0.3/convert?"
    
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
    
     func converted(_ to: CurrencyUnit)  {

            var baseCurrency = "USD"
            var convertAmount = 2555.0
            var fromCurrency = self.unit?.currencyIdentifier
            var toCurrency = to.currencyIdentifier
            let paras: Parameters = [
                "from": fromCurrency,
                "to" : toCurrency,
                "quantity" : convertAmount,
                "api_key" : Currency.API_KEY
            ]
        
       
            var returnValue : Double?
        
            Alamofire.request(Currency.baseURL, method: .get, parameters: paras, encoding: URLEncoding(destination: .queryString)).responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    let convertedCurrencyValue = JSON(value)["value"].double
                    returnValue = convertedCurrencyValue
                    self.unitValue = convertedCurrencyValue!
                    print(self.unitValue)
                case .failure(let error):
                    print(error)
                }
            }
            
        
        
    }
    
}


var currency = Currency.init(unit: .AED, unitValue: 3.0)

currency.unitValue
currency.converted(.ARS)
currency.unitValue


enum CurrencyUnit : String, CaseIterable{
    case AED = "UAE Dirham"
    case ALL = "Albanian Lek"
    case DZD = "Algerian Dinar"
    case ARS = "Argentine Peso"
    case AWG = "Aruba Florin"
    case AUD = "Australian Dollar"
    case BSD = "Bahamian Dollar"
    case BHD = "Bahraini Dinar"
    case BDT = "Bangladesh Taka"
    case BBD = "Barbados Dollar"
    case BYR = "Belarus Ruble"
    case BZD = "Belize Dollar"
    case BMD = "Bermuda Dollar"
    case BTN = "Bhutan Ngultrum"
    case BOB = "Bolivian Boliviano"
    case BWP = "Botswana Pula"
    case BRL = "Brazilian Real"
    case GBP = "British Pound"
    case BND = "Brunei Dollar"
    case BGN = "Bulgarian Lev"
    case BIF = "Burundi Franc"
    case KHR = "Cambodia Riel"
    case CAD = "Canadian Dollar"
    case CVE = "Cape Verde Escudo"
    case KYD = "Cayman Islands Dollar"
    case XOF = "CFA Franc (BCEAO)"
    case XAF = "CFA Franc (BEAC)"
    case CLP = "Chilean Peso"
    case CNY = "Chinese Yuan"
    case COP = "Colombian Peso"
    case KMF = "Comoros Franc"
    case CRC = "Costa Rica Colon"
    case HRK = "Croatian Kuna"
    case CUP = "Cuban Peso"
    case CZK = "Czech Koruna"
    case DKK = "Danish Krone"
    case DJF = "Djibouti Franc"
    case DOP = "Dominican Peso"
    case XCD = "East Caribbean Dollar"
    case EGP = "Egyptian Pound"
    case SVC = "El Salvador Colon"
    case ETB = "Ethiopian Birr"
    case EUR = "Euro"
    case FKP = "Falkland Islands Pound"
    case FJD = "Fiji Dollar"
    case GMD = "Gambian Dalasi"
    case GHS = "Ghanaian Cedi"
    case GTQ = "Guatemala Quetzal"
    case GNF = "Guinea Franc"
    case GYD = "Guyana Dollar"
    case HTG = "Haiti Gourde"
    case HNL = "Honduras Lempira"
    case HKD = "Hong Kong Dollar"
    case HUF = "Hungarian Forint"
    case ISK = "Iceland Krona"
    case INR = "Indian Rupee"
    case IDR = "Indonesian Rupiah"
    case IRR = "Iran Rial"
    case IQD = "Iraqi Dinar"
    case ILS = "Israeli Shekel"
    case JPY = "Japanese Yen"
    case JOD = "Jordanian Dinar"
    case KZT = "Kazakhstan Tenge"
    case KES = "Kenyan Shilling"
    case KRW = "Korean Won"
    case KWD = "Kuwaiti Dinar"
    case KGS = "Kyrgyzstan Som"
    case MOP = "Macau Pataca"
    case MKD = "Macedonian Denar"
    case MWK = "Malawi Kwacha"
}
var API_KEY = "cYsl7UrbIyEXnJrykVueciRMz1IJHAko"
var baseURL = "https://forex.1forge.com/1.0.3/convert?"
var baseCurrency = "USD"
var convertAmount = 2555.0
var fromCurrency = "JPY"
var toCurrency = "EUR"
let paras: Parameters = [
    "from": fromCurrency,
    "to" : toCurrency,
    "quantity" : convertAmount,
    "api_key" : API_KEY
]


func updateCurrency(URL: String, parameters: Parameters) {
    var returnValue : Double?
    Alamofire.request(URL, method: .get, parameters: parameters, encoding: URLEncoding(destination: .queryString)).responseJSON { (response) in
        switch response.result {
        case .success(let value):
            let convertedCurrencyValue = JSON(value)["value"].double
            returnValue = convertedCurrencyValue
            print(convertedCurrencyValue!)
        case .failure(let error):
            print(error)
        }
    }

}

let baseParams: Parameters = [
    "from": fromCurrency,
    "to" : baseCurrency,
    "quantity" : convertAmount,
    "api_key" : API_KEY
]

func changeBaseCurrency(URL: String, parameters: Parameters) {
    Alamofire.request(URL, method: .get, parameters: parameters, encoding: URLEncoding(destination: .queryString)).responseJSON { (response) in
        switch response.result {
        case .success(let value):
            let baseCurrencyValue = JSON(value)["value"].double
            print(baseCurrencyValue!)
        case .failure(let error):
            print(error)
        }
    }
}

