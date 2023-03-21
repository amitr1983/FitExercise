//
//  DateFormatter+Extension.swift
//  Fitbod
//
//  Created by Amit Rajoriya on 3/19/23.
//

import Foundation

/// Extension for date formatter which will be used when reading date from data file
extension DateFormatter {
    static let shortDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        return formatter
    }()
}
