//
//  DatepickerSample.swift
//  InterviewSwiftUI
//
//  Created by admin on 30/05/23.
//

import SwiftUI

struct DatepickerSample: View {
    @State var selectedDate = Date()
    @State var selectedTime = Date()
    @State var selectedDateTime = Date()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Group {
                    HStack {
                        Spacer()
                        Text("Date Pickers")
                            .font(Font.system(size: 22))
                            .fontWeight(.bold)
                        Spacer()
                    }
                }
                VStack(alignment: .leading, spacing: 20) {

                    Text("Pop up Calendar for Day,month,year:")
                        .font(Font.system(size: 20))
                        .fontWeight(.bold)
                    BaseDatePicker(selectedDate: $selectedDate,
                                   text: "",
                                   minDate: Date(),
                                   maxDate: Date.distantFuture,
                                   dateType: .dateOnly)
                    Text("Date is \(formatDate(selectedDate, style: .long, timeStyle: .none))")

                        .padding(.top, 16)
                }
                .padding()
                VStack(alignment: .leading, spacing: 20) {
                    Divider()
                    Text("Pop up Time for Time:")
                        .font(Font.system(size: 20))
                        .fontWeight(.bold)
                    BaseDatePicker(selectedDate: $selectedTime, text: "", dateType: .timeOnly)
                    Text("Time is \(formatTime(selectedTime, style: .short))")

                }.padding()

                VStack(alignment: .leading, spacing: 20) {
                    Divider()

                    Text("Pop up to show date and time:")
                        .font(Font.system(size: 20))
                        .fontWeight(.bold)
                    BaseDatePicker(selectedDate: $selectedDateTime, text: "", dateType: .datetime)
                    Text("Date and time is \(formatDateTime(selectedDateTime, dateStyle: .long, timeStyle: .short))")

                }.padding()
                VStack(alignment: .leading, spacing: 20) {
                    Divider()
                    Text("Wheel type Calendar:")
                        .font(Font.system(size: 20))
                        .fontWeight(.bold)
                    BaseDatePicker(selectedDate: $selectedDate, text: "", dateType: .datetime).datePickerStyle(.wheel)

                }.padding()

                Divider()
                VStack(alignment: .leading, spacing: 20) {
                    Text("Graphical Calendar:")
                        .font(Font.system(size: 20))
                        .fontWeight(.bold)
                    BaseDatePicker(selectedDate: $selectedDate,
                                   text: "",
                                   dateType: .datetime).datePickerStyle(.graphical)

                        .labelsHidden()
                }.padding()

            }
        }
    }
    func formatDate(_ date: Date, style: DateFormatter.Style, timeStyle: DateFormatter.Style) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = style
        formatter.timeStyle = timeStyle
        return formatter.string(from: date)
    }
    func formatTime(_ time: Date, style: DateFormatter.Style) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = style
        return formatter.string(from: time)
    }
    func formatDateTime(_ dateTime: Date, dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        return formatter.string(from: dateTime)
    }

}

struct DatepickerSample_Previews: PreviewProvider {
    static var previews: some View {
        DatepickerSample()
    }
}
