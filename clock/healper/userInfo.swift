//
//  userInfo.swift
//  clock
//
//  Created by Ilya Egorov on 12.02.2022.
//
import Foundation

enum FahrenheitOrCelsius: String {
    case Fahrenheit
    case Celsius
}

extension FahrenheitOrCelsius {
    var stringValue: String {
        return "\(self)"
    }
    
    var emoji: String {
        switch self {
        case .Celsius:
            return "℃"
        case .Fahrenheit:
            return "℉"
        }
    }
}
struct UserInfo {
    static let cities = "cities"
    static let fahrenheitOrCelsius = "fahrenheitOrCelsius"
    
    static func getCityList() -> [Coordinate]? {
        if let cityLists = UserDefaults.standard.value(forKey: cities) as? Data {
            let cityList = try? PropertyListDecoder().decode([Coordinate].self,
                                                             from: cityLists
            )
            return cityList
        }
        return nil
    }
    
    static func getFahrenheitOrCelsius() -> FahrenheitOrCelsius {
        if let fahrenheitOrCelsius = UserDefaults.standard.string(forKey: fahrenheitOrCelsius),
            let fahrenheitOrCelsiusValue = FahrenheitOrCelsius(rawValue: fahrenheitOrCelsius) {
            return fahrenheitOrCelsiusValue
        }
        return FahrenheitOrCelsius.Celsius
    }
}
