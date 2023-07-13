//
//  RadioSample.swift
//  iOS-native-code
//
//  Created by admin on 16/06/23.
//

import SwiftUI

struct RadioSample: View {
    @State private var selectedOptionVertical: String = ""
    @State private var selectedOptionHorizontal: String = ""

    let optionsVertical = ["Option 1", "Option 2", "Option 3"]
    let optionsHorizontal = ["One", "Two", "Three"]

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Text("Radiobutton")
                        .font(Font.system(size: 22))
                        .fontWeight(.bold)
                    Spacer()
                }
                Spacer().frame(height: 50)

                Text("Vertical Radio Button Option:")
                    .font(Font.system(size: 20))
                    .fontWeight(.bold)
                ForEach(optionsVertical, id: \.self) { option in
                    BaseRadio(selectedOption: $selectedOptionVertical,
                              option: option,
                              selectedColor: Asset.Assets.black.color,
                              unselectedColor: Asset.Assets.black.color,
                              fontSize: 20,
                              fontColor: Asset.Assets.black.color)
                }
                Text("Option: \(selectedOptionVertical)")
                    .bold()
                    .padding()
            }
            .padding()
            Divider()
            VStack(alignment: .leading) {
                Text("Horizontal Radio Button Option:")
                    .font(Font.system(size: 20))
                    .fontWeight(.bold)
                HStack {

                    ForEach(optionsHorizontal, id: \.self) { option in
                        BaseRadio(selectedOption: $selectedOptionHorizontal,
                                  option: option,
                                  selectedColor: Asset.Assets.black.color,
                                  unselectedColor: Asset.Assets.black.color,
                                  fontSize: 20,
                                  fontColor: Asset.Assets.black.color)
                    }

                }
                Text("Option: \(selectedOptionHorizontal)")
                    .bold()
                    .padding()
            }
            .padding()
            Spacer()
        }

    }
}

struct RadioSample_Previews: PreviewProvider {
    static var previews: some View {
        RadioSample()
    }
}
