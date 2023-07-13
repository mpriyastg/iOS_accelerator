//
//  DateUT.swift
//  InterviewSwiftUI
//
//  Created by admin on 10/06/23.
//

import SwiftUI

struct DateUtils: View {
    let currentDate = Date()
    let dateString = "2022-02-03"
    let startDate = Date()
    let endDate = Date()
    let format = "yyyy-MM-dd"

    var body: some View {
        ScrollView {
            VStack {
                Text("Original dateString: \(dateString)")
                let formattedDateString = "Formatted dateString: " +
                    "\(DateUtility.changeDateFormat(dateString, from: "yyyy-MM-dd", to: "MM-dd-yyyy"))"
                Text(formattedDateString)
                let timeDifference = DateUtility.calculateTimeDifferenceInSeconds(from: startDate, to: endDate)
                let text = "Difference between dates: \(timeDifference)"
                Text(text)
                if let date = DateUtility.convertStringToDate(dateString, format: format) {
                    Text("Convert String to Date:\(date)")
                }
                let dateString = DateUtility.convertDateToString(currentDate, format: format)
                Text("Convert date to string:\(dateString)")
            }.padding()
            VStack {
                Text("Formatted Date: \(DateUtility.formatDate(currentDate))")
                Text("Formatted Time: \(DateUtility.formatTime(currentDate))")
                Text("Year: \(DateUtility.getYear(currentDate))")
                Text("Month: \(DateUtility.getMonth(currentDate))")
                Text("Day: \(DateUtility.getDay(currentDate))")
            }
            VStack {
                Text("Custom Date: \(DateUtility.formatCustomDate(currentDate, format: "dd/MM/yyyy"))")
                Text("Relative Date: \(DateUtility.formatRelativeDate(currentDate))")
            }
            VStack {
                Text("Elapsed Time: \(DateUtility.formatElapsedTime(currentDate))")
                Text("Day of Week: \(DateUtility.formatDayOfWeek(currentDate))")
                Text("Month: \(DateUtility.formatMonth(currentDate))")
                Text("Year: \(DateUtility.formatYear(currentDate))")
                Text("Month Year: \(DateUtility.formatMonthYear(currentDate))")
            }
            VStack {
                Text("Day Month Year: \(DateUtility.formatDayMonthYear(currentDate))")
                Text("Weekday Month Day: \(DateUtility.formatWeekdayMonthDay(currentDate))")
                Text("Weekday Short Month Day: \(DateUtility.formatWeekdayShortMonthDay(currentDate))")
            }
        }
    }
}
struct DateUtils_Previews: PreviewProvider {
    static var previews: some View {
        DateUtils()
    }
}
