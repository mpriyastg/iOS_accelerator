//
//  Formatter+Extensions.swift
//  iOS-native-code
//
//  Created by Mohanapriya on 12/06/23.
//

import Foundation

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.usesGroupingSeparator = true
        return formatter
    }()

    static func convertTimeStampToDateFormat(timeStamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(TimeInterval(timeStamp)))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .short
        dateFormatter.timeZone = NSTimeZone() as TimeZone
        return dateFormatter.string(from: date)
    }

    static func convertTimeStampToTime(timeStamp: Int) -> String {
        let time = Date(timeIntervalSince1970: TimeInterval(timeStamp))
        let dateFormatter = DateFormatter()
        let dateFormatterTime = DateFormatter()
        dateFormatterTime.timeStyle = .short
        dateFormatter.dateStyle = .none
        dateFormatterTime.timeZone = NSTimeZone() as TimeZone
        return dateFormatterTime.string(from: time)
    }

    static func formattedWithCommaSeparator(_ number: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.usesGroupingSeparator = true // Enabled separator
        numberFormatter.groupingSeparator = "," // Set the separator to "," (e.g. 1000000 = 1,000,000)
        numberFormatter.groupingSize = 3
        return numberFormatter.string(for: number) ?? "0"
    }
}
