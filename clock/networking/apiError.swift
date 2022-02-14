//
//  apiError.swift
//  clock
//
//  Created by Ilya Egorov on 12.02.2022.
//

import Foundation

enum APIError: LocalizedError {
    case invalidURL
    case requestFailed
    case networkFailed
    case decodingFailed
    case dataFailed
    
    public var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "не работает"
        case .requestFailed:
            return "не работает"
        case .networkFailed:
            return "не работает"
        case .decodingFailed:
            return "не работает"
        case .dataFailed:
            return "не работает"
        }
    }
}
