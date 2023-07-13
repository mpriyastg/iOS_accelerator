//
//  DateUtils.swift
//  InterviewSwiftUI
//
//  Created by admin on 10/06/23.
//

import Foundation
class DateUtility {
    static func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
    static func changeDateFormat(_ dateString: String, from currentFormat: String, to targetFormat: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = currentFormat

        if let date = formatter.date(from: dateString) {
            formatter.dateFormat = targetFormat
            return formatter.string(from: date)
        }

        return ""
    }
    static func convertDateToString(_ date: Date, format: String) -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = format
           return dateFormatter.string(from: date)
       }
    static func convertStringToDate(_ dateString: String, format: String) -> Date? {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = format
           return dateFormatter.date(from: dateString)
       }
    static func calculateTimeDifferenceInSeconds(from startDate: Date, to endDate: Date) -> TimeInterval {
            return endDate.timeIntervalSince(startDate)
        }
    static func formatTime(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .medium
        return dateFormatter.string(from: date)
    }

    static func getYear(_ date: Date) -> Int {
        let calendar = Calendar.current
        return calendar.component(.year, from: date)
    }

    static func getMonth(_ date: Date) -> Int {
        let calendar = Calendar.current
        return calendar.component(.month, from: date)
    }

    static func getDay(_ date: Date) -> Int {
        let calendar = Calendar.current
        return calendar.component(.day, from: date)
    }

    static func getNextDay(_ date: Date) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .day, value: 1, to: date)!
    }

    static func getPreviousDay(_ date: Date) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .day, value: -1, to: date)!
    }

    static func addDays(_ date: Date, days: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .day, value: days, to: date)!
    }

    static func subtractDays(_ date: Date, days: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .day, value: -days, to: date)!
    }

    static func getStartOfDay(_ date: Date) -> Date {
        let calendar = Calendar.current
        return calendar.startOfDay(for: date)
    }

    static func getEndOfDay(_ date: Date) -> Date {
        let calendar = Calendar.current
        let endOfDay = calendar.date(bySettingHour: 23, minute: 59, second: 59, of: date)!
        return endOfDay
    }

    static func isSameDay(_ date1: Date, _ date2: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }

    static func formatShortDate(_ date: Date) -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateStyle = .short
           return dateFormatter.string(from: date)
       }

       static func formatLongDate(_ date: Date) -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateStyle = .long
           return dateFormatter.string(from: date)
       }

       static func formatCustomDate(_ date: Date, format: String) -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = format
           return dateFormatter.string(from: date)
       }

       static func formatRelativeDate(_ date: Date) -> String {
           let formatter = RelativeDateTimeFormatter()
           formatter.unitsStyle = .full
           return formatter.localizedString(for: date, relativeTo: Date())
       }

       static func formatElapsedTime(_ date: Date) -> String {
           let formatter = DateComponentsFormatter()
           formatter.allowedUnits = [.day, .hour, .minute, .second]
           formatter.unitsStyle = .abbreviated
           return formatter.string(from: date, to: Date()) ?? ""
       }

       static func formatDayOfWeek(_ date: Date) -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "EEEE"
           return dateFormatter.string(from: date)
       }

       static func formatMonth(_ date: Date) -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "MMMM"
           return dateFormatter.string(from: date)
       }

       static func formatYear(_ date: Date) -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy"
           return dateFormatter.string(from: date)
       }

       static func formatMonthYear(_ date: Date) -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "MMMM yyyy"
           return dateFormatter.string(from: date)
       }

       static func formatDayMonthYear(_ date: Date) -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "dd MMMM yyyy"
           return dateFormatter.string(from: date)
       }

       static func formatWeekdayMonthDay(_ date: Date) -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "EEEE, MMMM d"
           return dateFormatter.string(from: date)
       }

       static func formatWeekdayShortMonthDay(_ date: Date) -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "E, MMM d"
           return dateFormatter.string(from: date)
       }

}
extension Date {
    static func from(year: Int, month: Int, day: Int, hour: Int? = 0, min: Int? = 0, sec: Int? = 0) -> Date?
    {
        let gregorianCalendar = Calendar(identifier: .gregorian)
        let dateComponents = DateComponents(calendar: gregorianCalendar, year: year, month: month, day: day, hour: hour, minute: min, second: sec)
        return gregorianCalendar.date(from: dateComponents)
    }
}
