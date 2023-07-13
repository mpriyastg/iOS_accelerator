import SwiftUI

struct ToggleSample: View {
    @State private var isPlainToggleOn = false
    @State private var isImageToggleOn = false
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                HStack {
                    Spacer()
                    Text("Toggles")
                        .font(Font.system(size: 22))
                        .fontWeight(.bold)
                    Spacer()
                }
                Text("Plain Toggle:")
                    .font(Font.system(size: 20))
                    .fontWeight(.bold)
                BaseToggle(toggleType: .plain,
                           isToggleOn: $isPlainToggleOn,
                           toogleColor: .green,
                           text: "Turn on")
                Text("Value: \(isPlainToggleOn.description)") // Display the value of the plain toggle
                Divider()
            }
            Text("Plain Toggle with Image:")
                .font(Font.system(size: 20))
                .fontWeight(.bold)
            BaseToggle(toggleType: .withImage,
                       isToggleOn: $isImageToggleOn,
                       toogleColor: Asset.Assets.black.color,
                       text: "Tick",
                       onImageToggle: "checkmark",
                       offImageToggle: "xmark")
                .font(Font.system(size: 20))
                .foregroundColor(Asset.Assets.black.color)
            Text("Value: \(isImageToggleOn.description)") // Display the value of the image toggle
            Spacer()
        }
        .padding()
    }
}
