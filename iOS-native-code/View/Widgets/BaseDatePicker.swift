//
//  BaseDatePicker.swift
//  InterviewSwiftUI
//
//  Created by admin on 30/05/23.
//

import SwiftUI

enum DateType {
    case dateOnly
    case timeOnly
    case datetime

}

struct BaseDatePicker: View {
    @Binding var selectedDate: Date
    @State var text = ""
    @State var textColor: Color = .blue
    @State var buttonFontSize: CGFloat = 14
    @State var minDate =  Calendar.current.date(byAdding: .year, value: -1, to: Date())!
    @State var maxDate = Calendar.current.date(byAdding: .year, value: 1, to: Date())!
    @State var dateType: DateType = .dateOnly

    var body: some View {
        VStack {
            if dateType == .dateOnly {
                DatePicker(selection: $selectedDate, in: minDate...maxDate, displayedComponents: .date) {
                    Text(text)
                        .foregroundColor(textColor)
                        .font(Font.system(size: buttonFontSize))

                }

            }
            if dateType == .timeOnly {
                DatePicker(selection: $selectedDate, in: Date()..., displayedComponents: .hourAndMinute) {
                    Text(text)
                        .foregroundColor(textColor)
                        .font(Font.system(size: buttonFontSize))

                }

            }
            if dateType == .datetime {
                DatePicker(selection: $selectedDate, in: ...Date(), displayedComponents: [.date, .hourAndMinute]) {
                    Text(text)
                        .foregroundColor(textColor)
                        .font(Font.system(size: buttonFontSize))

                }

            }

        }
        .padding()

    }
}

struct BaseDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        BaseDatePicker(selectedDate: .constant(Date()))
    }
}
