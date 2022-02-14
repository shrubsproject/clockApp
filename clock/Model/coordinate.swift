//
//  coordinate.swift
//  clock
//
//  Created by Ilya Egorov on 12.02.2022.
//
import Foundation

struct Coordinate: Codable {
    let lat: Double
    let lon: Double
}

extension Coordinate: Equatable {
    static func ==(A: Coordinate, B: Coordinate) -> Bool {
        return A.lat == B.lat && A.lon == B.lon
    }
}
