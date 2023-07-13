//
//  CheckboxSample.swift
//  iOS-native-code
//
//  Created by admin on 16/06/23.
//

import SwiftUI

struct CheckboxSample: View {
    @State private var selectedOptionsVertical: Set<String> = []
    @State private var selectedOptionsHorizontal: Set<String> = []

       let optionsVertical = ["Option 1", "Option 2", "Option 3"]
    let optionsHorizontal = ["One", "Two", "Three"]

       var body: some View {
           VStack(alignment: .leading, spacing: 20) {
               HStack {
                   Spacer()
                   Text("Checkbox")
                       .font(Font.system(size: 22))
                       .fontWeight(.bold)
                   Spacer()
               }
               VStack(alignment: .leading, spacing: 20) {

                   Text("Vertical CheckBox Option:")
                       .font(Font.system(size: 20))
                       .fontWeight(.bold)
                   ForEach( optionsVertical, id: \.self) { option in
                       BaseCheckBox(fontSize: 20,
                                    fontColor: Asset.Assets.black.color,
                                    option: option,
                                    isSelected: selectedOptionsVertical.contains(option)) { isSelected in
                           if isSelected {
                               selectedOptionsVertical.insert(option)
                           } else {
                               selectedOptionsVertical.remove(option)
                           }
                       }

                   }
                   Text("Selected Options: \(selectedOptionsVertical.joined(separator: ", "))")
                       .font(.title3).bold()
               }.padding()
               Divider()
               VStack(alignment: .leading, spacing: 20) {
                   Text("Horizontal CheckBox Option:")
                       .font(Font.system(size: 20))
                       .fontWeight(.bold)
                   HStack {

                       ForEach( optionsHorizontal, id: \.self) { option in
                           BaseCheckBox(fontSize: 20,
                                        fontColor: Asset.Assets.black.color,
                                        option: option,
                                        isSelected: selectedOptionsHorizontal.contains(option)) { isSelected in
                               if isSelected {
                                   selectedOptionsHorizontal.insert(option)
                               } else {
                                   selectedOptionsHorizontal.remove(option)
                               }
                           }

                       }
                   }

                   Text("Selected Options: \(selectedOptionsHorizontal.joined(separator: ", "))")
                       .font(.title3).bold()
               }.padding()
              Spacer()
           }
           .padding()
       }
}

struct CheckboxSample_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxSample()
    }
}
