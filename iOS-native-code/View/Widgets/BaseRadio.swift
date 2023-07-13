//
//  BaseRadio.swift
//  InterviewSwiftUI
//
//  Created by admin on 13/06/23.
//

import SwiftUI

struct BaseRadio: View {

    @Binding var selectedOption: String
      var option: String
      var selectedColor: Color
      var unselectedColor: Color
    @State var fontSize: CGFloat = 15
    @State var fontColor: Color = .blue
    @State var fontWeight: Font.Weight = .medium
    @State var isUnderLine: Bool = false
    var body: some View {
        Button(action: {
            if selectedOption == option {
                selectedOption = ""
            } else {
                selectedOption = option
            }
        }, label: {
            HStack {
                Image(systemName: selectedOption == option ? "largecircle.fill.circle" : "circle")
                    .font(.system(size: fontSize))
                    .foregroundColor(selectedOption == option ? selectedColor : unselectedColor)
                Text(option)
                    .font(.system(size: fontSize))
                    .foregroundColor(fontColor)
                    .fontWeight(fontWeight)
                    .underline(isUnderLine, color: fontColor)
            }
        })
        .buttonStyle(RadioButtonStyle())
    }

}

struct BaseRadio_Previews: PreviewProvider {
    static var previews: some View {
        BaseRadio(selectedOption: .constant("test"), option: "test", selectedColor: .red, unselectedColor: .blue)
    }
}

struct RadioButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
          configuration.label
              .foregroundColor(.primary)
              .font(.body)
              .padding()
      }
}
