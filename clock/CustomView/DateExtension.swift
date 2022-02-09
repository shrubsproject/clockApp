//
//  DateExtension.swift
//  clock
//
//  Created by Konstantin Kozhevnikov on 09.02.2022.
//

import Foundation

extension Date {
    var dateComponents: DateComponents {
        let calendar = Calendar(identifier: .gregorian)
        let dateComponenets = calendar.dateComponents([.year, .month, .day, .second, .minute, .hour], from: self)
        return dateComponenets
    }
    var second: NSInteger {
        return dateComponents.second ?? 0
    }
    var minute: NSInteger {
        return dateComponents.minute ?? 0
    }
    var hour: NSInteger {
        return dateComponents.hour ?? 0
    }
}

