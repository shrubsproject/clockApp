//
//  baseURL.swift
//  clock
//
//  Created by Ilya Egorov on 12.02.2022.
//

import Foundation

struct BaseURL {
    static let weatherURL = "https://api.openweathermap.org"
    static let webURL = "https://weather.com/"
}

struct BasePath {
    static let list = "/data/2.5/weather"
    static let current = "/data/2.5/forecast"
}
