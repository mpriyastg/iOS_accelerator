//
//  WidgetsView.swift
//  iOS-native-code
//
//  Created by admin on 25/05/23.
//

import SwiftUI

struct WidgetsView: View {
    let menuArr = [
           "TextFields",
           "Button",
           "Date Picker",
           "Label",
           "Toggle",
           "List",
           "Radio Button",
           "CheckBox",
           "Slider"
       ]

       var body: some View {
           if #available(iOS 16.0, *) {
               NavigationStack {
                   List(menuArr, id: \.self) { menu in
                       NavigationLink {
                           if menu == "TextFields"{
                               TextFieldsSample()
                           } else if menu == "Button"{
                               ButtonSample()
                           } else if menu == "Date Picker"{
                               DatepickerSample()
                           } else if menu == "Label"{
                               LabelSample()
                           } else if menu == "Toggle"{
                               ToggleSample()
                           } else if menu == "Radio Button"{
                               RadioSample()
                           } else if menu == "CheckBox"{
                               CheckboxSample()
                           } else if menu == "Slider"{
                               SliderSample()
                           } else if menu == "List"{
                               ListSample().padding()
                           }
                       } label: {
                           Text(menu)
                       }
                   }
               }
           } else {
               // Fallback on earlier versions
           }
       }
}

struct WidgetsView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetsView()
    }
}
